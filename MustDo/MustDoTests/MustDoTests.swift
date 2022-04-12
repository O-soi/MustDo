//
//  MustDoTests.swift
//  MustDoTests
//
//  Created by 남기범 on 2022/02/28.
//

import XCTest
import Combine
import ComposableArchitecture

@testable import MustDo

class MustDoTests: XCTestCase {
    let scheduler = DispatchQueue.test

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        
    }

    func test_request_mustDoList() {
        let store = TestStore(
            initialState: MustDoState(),
            reducer: mustDoReducer,
            environment: MustDoEnvironment(
                queue: scheduler.eraseToAnyScheduler(),
                interactor: MustDoInteractor(repository: StubMustDoRepository())
            )
        )
        
        store.send(.requestMustDoList(userID: 0))
        self.scheduler.advance()
        store.receive(.mustDoListResponse(.success([dummyMustDo]))) {
            $0.mustDoList = [dummyMustDo]
        }
    }
}

class StubMustDoRepository: MustDoRepositoryProtocol {
    func requestMustDoList(userID: Int) -> Future<[MustDo], Error> {
        return Future { promise in
            promise(.success([dummyMustDo]))
        }
    }
    
    func addMustDo(userID: Int) {
        
    }
    
    func updateMustDo(userID: Int, percent: Double) {
        
    }
}
