//
//  MustDoListUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation
import Combine
import Module

public final class MustDoListUsecase {
    private let repository: MustDoRepositoryProtocol
    
    private let mustDoListPagenationUsecase: PagenationUsecase<Int, MustDo>
    private let itemsSubject = CommonCurrentValueSubject<[MustDo]>([])
    private let isLoadingSubject = CommonCurrentValueSubject<Bool>(true)
    
    private let cancellable = CancellableBag()
    
    public init(repository: MustDoRepositoryProtocol) {
        self.repository = repository
        
        mustDoListPagenationUsecase = PagenationUsecase { [weak repository] direction in
            guard let repository = repository else { return nil }
            let cursor = direction?.cursor ?? 0
            let items = try await repository.mustDoItems(page: cursor, limit: 10)
            return Page(nextCursor: cursor + items.count, items: items)
        }
        
        mustDoListPagenationUsecase.$items
            .sink { [weak self] in
                self?.itemsSubject.send($0)
            }
            .store(in: cancellable)
        
        mustDoListPagenationUsecase.$isLoading
            .sink { [weak self] in
                self?.isLoadingSubject.send($0)
            }
            .store(in: cancellable)
    }
}

public extension MustDoListUsecase {
    var items: CommonPublisher<[MustDo]> {
        itemsSubject
            .eraseToAnyPublisher()
    }
    
    var isLoading: CommonPublisher<Bool> {
        isLoadingSubject
            .eraseToAnyPublisher()
    }
    
    func loadItems() {
        Task {
            try await mustDoListPagenationUsecase.renewPage()
        }
    }
    
    func nextItems() {
        Task {
            try await mustDoListPagenationUsecase.nextPage()
        }
    }
}
