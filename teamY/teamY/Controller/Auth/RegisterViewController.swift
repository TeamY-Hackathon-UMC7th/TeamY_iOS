//
//  RegisterViewController.swift
//  teamY
//
//  Created by 김도연 on 1/11/25.
//

import UIKit

class RegisterViewController: UIViewController {
    private let registerView = AuthView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetting()
    }
    
    func viewSetting() {
        view.addSubview(registerView)
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
