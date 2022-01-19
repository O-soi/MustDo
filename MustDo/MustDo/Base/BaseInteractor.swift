//
//  BaseInteractor.swift
//  MustDo
//
//  Created by 남기범 on 2022/01/05.
//

import Foundation
import Combine

struct BaseInteractor {
    private let repository: BaseRepository
    private let state: AppState
    
    init(repository: BaseRepository, state: AppState) {
        self.repository = repository
        self.state = state
    }

    func loadMustDo() {
        _ = repository
            .loadMustDo()
            .assign(to: \.listDataSource, on: self.state)
    }
}
