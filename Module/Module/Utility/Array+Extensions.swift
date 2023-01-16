//
//  Array+Extensions.swift
//  Module
//
//  Created by tuna.can on 2023/01/16.
//

import Foundation

public extension Array where Element: Hashable {
    var removedDuplicates: Self {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
