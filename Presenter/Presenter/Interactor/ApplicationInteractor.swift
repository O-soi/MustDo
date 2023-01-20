//
//  ApplicationInteractor.swift
//  Presenter
//
//  Created by 남기범 on 2023/01/18.
//

import Foundation
import Usecase

public final class ApplicationInteractor: ObservableObject {
    private let usecase: ApplicationUsecase?
    
    public init(usecase: ApplicationUsecase? = nil) {
        self.usecase = usecase
    }
}

public extension ApplicationInteractor {
    func initialized() {
        usecase?.migrateTodayRepeatMustDoIfNeeded()
    }
}
