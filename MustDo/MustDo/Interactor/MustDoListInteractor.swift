//
//  MustDoListInteractor.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation
import Combine

final class MustDoListInteractor: ObservableObject {
    private let mustDoListUsecase = MustDoListUsecase()
    
    @Published var mustDoList: [MustDo] = []
    
    func loadMustDoList() {
        mustDoList = [
            MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDo(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.")
        ]
    }
}
