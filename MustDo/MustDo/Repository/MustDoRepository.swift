//
//  MustDoRepository.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation
import Usecase

struct MustDoRepository: MustDoRepositoryProtocol {
    func mustDoItems() -> [MustDo] {
        [MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
         MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
         MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
         MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
         MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
         MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.")]
    }
}
