//
//  RemoteAPI.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation
import BeomkeyRemote
import Alamofire

struct API {
    enum MustDoList: RemoteAPIProtocol {
        var path: String {
            return ""
        }
        
        var method: HTTPMethod {
            return .get
        }
    }
}
