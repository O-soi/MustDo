//
//  MustDoViewModel.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation
import Combine

class MustDoViewModel: ObservableObject {
    private let mustDoUsecase: MustDoUsecaseProtocol
    
    @Published var mustDoList: [MustDo] = []
    
    init(mustDoUsecase: MustDoUsecaseProtocol) {
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
        let mustDoUsecase = MustDoUsecase(repository: repository)
        let viewModel = MustDoViewModel(mustDoUsecase: mustDoUsecase)
        return viewModel
    }
}
