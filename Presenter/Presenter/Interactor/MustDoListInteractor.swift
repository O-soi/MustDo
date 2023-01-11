//
//  MustDoListInteractor.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation
import Combine
import Usecase

public final class MustDoListInteractor: ObservableObject {
    private let mustDoListUsecase = MustDoListUsecase()
    
    @Published public var mustDoList: [MustDoCellViewModel] = []
    @Published public var currentDay: String = "23.12.22"
    
    public init() {}
}

public extension MustDoListInteractor {
    func loadMustDoList() {
        mustDoList = [
            MustDoCellViewModel(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDoCellViewModel(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDoCellViewModel(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDoCellViewModel(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDoCellViewModel(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다."),
            MustDoCellViewModel(repeatDays: [.mon], duration: 3600, discription: "이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.이건 테스트용 텍스트 입니다.")
        ]
    }
    
    func movePrevDay() {
        
    }
    
    func moveNextDay() {
        
    }
    
    func routeAddMustDoScene() {
        
    }
}
