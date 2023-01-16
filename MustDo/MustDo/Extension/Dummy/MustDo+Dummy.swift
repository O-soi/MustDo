//
//  MustDo+Dummy.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation
import Presenter

public extension MustDoItemViewModel {
    static var dummy: MustDoItemViewModel {
        MustDoItemViewModel(duration: 3600,
                            discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.",
                            id: UUID().uuidString)
    }
}

public extension Array where Element == MustDoItemViewModel {
    static func dummy(_ count: Int) -> Self {
        (0..<count).map { _ in MustDoItemViewModel.dummy }
    }
}
