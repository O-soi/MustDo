//
//  CancellableBag.swift
//  Module
//
//  Created by tuna.can on 2023/01/16.
//

import Foundation
import Combine

public final class CancellableBag {
    fileprivate var cancellables = Set<AnyCancellable>()
    
    public init() {}
}

public extension CancellableBag {
    func dispose() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}

public extension Cancellable {
    func store(in bag: CancellableBag) {
        store(in: &bag.cancellables)
    }
}
