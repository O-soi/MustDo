//
//  RepositoryFactoryProtocol.swift
//  Usecase
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation

public protocol RepositoryFactoryProtocol {
    var mustDo: MustDoRepositoryProtocol { get }
}
