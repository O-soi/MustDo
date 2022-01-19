//
//  AppState.swift
//  MustDo
//
//  Created by 남기범 on 2022/01/05.
//

import Foundation
import SwiftUI

class AppState: ObservableObject {
    @Published var listDataSource: [MustDo] = []
}
