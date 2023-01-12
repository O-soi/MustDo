//
//  MustDoListInteractor.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation
import Usecase

public final class MustDoListInteractor: ObservableObject {
    @Published public var mustDoItems: [MustDoItemViewModel] = []
    @Published public var currentDay: String = "23.12.22"
    
    private let usecase: MustDoListUsecase?
    
    public init(usecase: MustDoListUsecase? = nil) {
        self.usecase = usecase
    }
}

public extension MustDoListInteractor {
    func viewDidLoad() {
        guard let usecase else { return }
        mustDoItems = usecase.loadMustDoItems()
            .map(MustDoItemViewModel.init(mustDo:))
    }
    
    func movePrevDay() {
        
    }
    
    func moveNextDay() {
        
    }
    
    func routeAddMustDoScene() {
        
    }
}
