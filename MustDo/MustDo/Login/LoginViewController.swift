//
//  GoogleLoginViewController.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/20.
//

import Foundation
import UIKit
import SwiftUI

final class LoginViewController: UIViewController {
    private let mainTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let googleLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTargetAction()
        setupLayout()
        setupStyling()
    }
    
    func setupLayout() {
        [mainTitleLabel, descriptionLabel, googleLoginButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraints = [NSLayoutConstraint]()
        
        view.addSubview(mainTitleLabel)
        constraints += [
            mainTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            mainTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        view.addSubview(descriptionLabel)
        constraints += [
            descriptionLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 50),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ]
        
        view.addSubview(googleLoginButton)
        constraints += [
            googleLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            googleLoginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            googleLoginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            googleLoginButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupStyling() {
        view.backgroundColor = .systemBackground
        
        mainTitleLabel.font = .systemFont(ofSize: 70, weight: .heavy)
        mainTitleLabel.text = "MustDo"
        
        let loginDescriptionString = """
        하기 싫지만, 무조건 해야되는 일!

        정해진 시간을 타이머로 설정해서 모두 소모해야 목표가 완료 처리됩니다.

        타이머가 실행되는 동안, 앱을 나가거나 종료할 경우 타이머는 멈추고 다시 앱에 돌아왔을 때 광고가 표시됩니다.

        광고를 보기 싫다면, 집중해서 목표를 완료하세요!

        (중간에 타이머를 멈출 수 있으니, 급한 용무라면 타이머를 멈췄다가 멈춘 시간부터 재시작할 수 있습니다.)
        """
        
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .medium)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = loginDescriptionString
        
        descriptionLabel.textColor = .darkGray
        
        googleLoginButton.setTitle("Google 계정 로그인", for: .normal)
        googleLoginButton.backgroundColor = .gray
        googleLoginButton.layer.cornerRadius = 5
    }
    
    private func setTargetAction() {
        googleLoginButton.addTarget(self, action: #selector(googleLoginAction), for: .touchUpInside)
    }
}

extension LoginViewController: GoogleLoginProtocol {
    @objc
    private func googleLoginAction() {
        Task.detached(priority: .background, operation: {
            do {
                try await self.requestGoogleLogin()
                
                DispatchQueue.main.async { [weak self] in
                    self?.dismiss(animated: false, completion: {
                        let baseView = MainTabView()
                        UIApplication.shared.keyWindow?.rootViewController = UIHostingController(rootView: baseView)
                    })
                }
            } catch let error {
                await self.alert(with: error)
            }
        })
    }
    
    private func alert(with error: Error) {
        let isCanceledLogin = (error as NSError).code == -5
        
        let alertVC = UIAlertController(
            title: isCanceledLogin == true ? "로그인 취소" : "로그인 실패",
            message: isCanceledLogin == true ? "로그인을 취소하셨습니다." : "로그인 에러가 발생했습니다.",
            preferredStyle: .alert
        )
        
        let alertItem = UIAlertAction(
            title: "확인",
            style: .default,
            handler: nil
        )
        
        alertVC.addAction(alertItem)
        print("[🔥error] 구글 로그인 에러 - 메시지: \(error.localizedDescription)")
        present(alertVC, animated: true, completion: nil)
    }
}
