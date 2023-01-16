//
//  MustDoListInteractor.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation
import Usecase
import Module

public final class MustDoListInteractor: ObservableObject {
    @Published public var items = [MustDoItemViewModel]()
    @Published public var isLoading = true
    @Published public var currentDay = "23.12.22"
    
    private let usecase: MustDoListUsecase?
    private let cancellableBag = CancellableBag()
    
    public init(usecase: MustDoListUsecase? = nil) {
        self.usecase = usecase
        
        usecase?.items
            .map { $0.map(MustDoItemViewModel.init(mustDo:)) }
            .drive { [weak self] in
                self?.items = $0
            }
            .store(in: cancellableBag)
        
        usecase?.isLoading
            .drive { [weak self] in
                self?.isLoading = $0
            }
            .store(in: cancellableBag)
    }
}

public extension MustDoListInteractor {
    func viewDidLoad() {
        usecase?.loadItems()
    }
    
    func scrollToBottom() {
        usecase?.nextItems()
    }
    
    func movePrevDay() {
        
    }
    
    func moveNextDay() {
        
    }
    
    func routeAddMustDoScene() {
        
    }
}
