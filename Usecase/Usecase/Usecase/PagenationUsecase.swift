//
//  PagenationUsecase.swift
//  Usecase
//
//  Created by tuna.can on 2023/01/16.
//

import Foundation
import Combine
import Module

public enum PagenationError: CommonError {
    case cursorNotExisted
    
    public var description: String {
        switch self {
        case .cursorNotExisted:
            return "대응하는 커서가 존재하지 않습니다."
        }
    }
}

public enum PageDirection<CursorType> {
    case prev(CursorType)
    case next(CursorType)
    
    var cursor: CursorType? {
        switch self {
        case let .prev(cursor),
             let .next(cursor):
            return cursor
        }
    }
}

public struct Page<CursorType, DataModelType> {
    var prevCursor: CursorType?
    var nextCursor: CursorType?
    var items: [DataModelType]
    
    init(prevCursor: CursorType? = nil, nextCursor: CursorType? = nil, items: [DataModelType]) {
        self.prevCursor = prevCursor
        self.nextCursor = nextCursor
        self.items = items
    }
}

public final actor PagenationUsecase<CursorType, DataModelType: Hashable> {
    public typealias PageModel = Page<CursorType, DataModelType>
    public typealias PageAPI = (PageDirection<CursorType>?) async throws -> PageModel?
    public typealias DataModelType = DataModelType
    
    @Published public private(set) var items = [DataModelType]()
    @Published public private(set) var isLoading = false
    
    private let api: PageAPI
    private var prevCursor: CursorType?
    private var nextCursor: CursorType?
    
    public init(api: @escaping PageAPI) {
        self.api = api
    }
}

extension PagenationUsecase {
    public func renewPage() async throws {
        guard let result = try await loadData(nil) else { return }
        updateCursor(result)
        items = result.items
    }
    
    public func nextPage() async throws {
        guard let nextCursor else { throw PagenationError.cursorNotExisted }
        guard let result = try await loadData(PageDirection.next(nextCursor)) else { return }
        updateCursor(result)
        items = (items + result.items).removedDuplicates
    }
    
    public func prevPage() async throws  {
        guard let prevCursor else { throw PagenationError.cursorNotExisted }
        guard let result = try await loadData(PageDirection.prev(prevCursor)) else { return }
        updateCursor(result)
        items = (result.items + items).removedDuplicates
    }
    
    @discardableResult
    public func remove(data: DataModelType) async throws -> DataModelType? {
        guard let index = items.firstIndex(where: { $0 == data }) else { return nil }
        return items.remove(at: index)
    }
}

private extension PagenationUsecase {
    func loadData(_ direction: PageDirection<CursorType>?) async throws -> PageModel? {
        isLoading = true
        let result = try await api(direction)
        isLoading = false
        return result
    }
    
    func updateCursor(_ page: PageModel) {
        prevCursor = page.prevCursor
        nextCursor = page.nextCursor
    }
}
