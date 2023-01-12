//
//  MustDoItemViewModel.swift
//  Presenter
//
//  Created by tuna.can on 2023/01/11.
//

import Foundation
import Usecase

public struct MustDoItemViewModel: Identifiable {
    public var duration: Int
    public var discription: String
    public var id = UUID()
    
    public init(duration: Int, discription: String, id: UUID = UUID()) {
        self.duration = duration
        self.discription = discription
        self.id = id
    }
}

public extension MustDoItemViewModel {
    init(mustDo: MustDo) {
        self.duration = mustDo.duration
        self.discription = mustDo.discription
        self.id = mustDo.id
    }
}
