//
//  MustDoRepositoryProtocol.swift
//  Usecase
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation

public protocol MustDoRepositoryProtocol: AnyActor {
    func mustDoItems(page: Int?, limit: Int) async throws -> [MustDo]
}
