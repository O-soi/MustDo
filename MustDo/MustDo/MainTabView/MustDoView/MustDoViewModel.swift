//
//  MustDoViewModel.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation
import ComposableArchitecture
import Combine

class MustDoViewModel: ObservableObject {
    private let mustDoUsecase: MustDoInteractorProtocol
    
    @Published var mustDoList: [MustDo] = []
    
    init(mustDoUsecase: MustDoInteractorProtocol) {
        self.mustDoUsecase = mustDoUsecase
    }
    
    func requestMustDoList(userID: Int) async throws {
        mustDoList = try await mustDoUsecase
            .requestMustDoList(userID: userID)
            .asyncStream()
            .pickFirst() ?? []
    }
    
    func addMustDo(userID: Int) {
        
    }
    
    func updateMustDo(userID: Int, percent: Double) {
        
    }
}

// MARK: - factory method
extension MustDoViewModel {
    static func factory() -> MustDoViewModel {
        let repository = MustDoRepository()
        let mustDoUsecase = MustDoInteractor(repository: repository)
        let viewModel = MustDoViewModel(mustDoUsecase: mustDoUsecase)
        return viewModel
    }
}
