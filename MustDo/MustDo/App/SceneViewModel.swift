//
//  SceneViewModel.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/16.
//

import Foundation

class SceneViewModel {
    private let sceneUsecase: SceneUsecaseProtocol
    
    init(usecase: SceneUsecaseProtocol) {
        self.sceneUsecase = usecase
    }
    
    func reLogin() async throws {
        try await sceneUsecase.reLogin()
    }
}

extension SceneViewModel {
    static func factory(usecase: SceneUsecaseProtocol = SceneUsecase.factory()) -> SceneViewModel {
        return SceneViewModel(usecase: usecase)
    }
}
