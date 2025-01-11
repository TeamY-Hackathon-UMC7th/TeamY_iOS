//
//  LoginViewController.swift
//  teamY
//
//  Created by 김도연 on 1/11/25.
//

import UIKit

class LoginViewController: UIViewController {
    private let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        viewSetting()
    }
    
    func viewSetting() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
