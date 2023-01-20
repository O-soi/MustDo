//
//  ApplicationRepository.swift
//  MustDo
//
//  Created by 남기범 on 2023/01/18.
//

import Foundation
import Usecase
import OSLog

struct ApplicationRepository: ApplicationRepositoryProtocol {
    private let cache: Cache = Cache.shared
    
    func migrateTodayRepeatMustDoIfNeeded() {
        cache.migrateTodayRepeatMustDoIfNeeded()
    }
}
