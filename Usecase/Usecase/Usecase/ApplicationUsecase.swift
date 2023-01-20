//
//  ApplicationUsecase.swift
//  Usecase
//
//  Created by 남기범 on 2023/01/18.
//

import Foundation

public final class ApplicationUsecase {
    private let repository: ApplicationRepositoryProtocol
    
    public init(repository: ApplicationRepositoryProtocol) {
        self.repository = repository
    }
}

public extension ApplicationUsecase {
    func migrateTodayRepeatMustDoIfNeeded() {
        self.repository.migrateTodayRepeatMustDoIfNeeded()
    }
}
