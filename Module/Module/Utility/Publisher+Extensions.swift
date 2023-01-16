//
//  Publisher+Extensions.swift
//  Module
//
//  Created by tuna.can on 2023/01/16.
//

import Foundation
import Combine

public extension Publisher where Self.Failure == Never {
    func drive(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable {
        receive(on: DispatchQueue.main)
            .sink(receiveValue: receiveValue)
    }
}
