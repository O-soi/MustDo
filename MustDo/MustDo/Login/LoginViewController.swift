//
//  GoogleLoginViewController.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/20.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    private let googleLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: GoogleLoginProtocol {
    
}
