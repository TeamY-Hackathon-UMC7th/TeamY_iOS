//
//  SelectTimeViewController.swift
//  teamY
//
//  Created by 이수현 on 1/11/25.
//

import UIKit


class SelectTimeViewController: UIViewController {
    private let selectTimeView = SelectTimeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = selectTimeView
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let leftBarButton = UIBarButtonItem(image: .init(systemName: "chevron.left"), style: .plain, target: self, action: #selector(popButton))
        leftBarButton.tintColor = .black
        self.navigationItem.setRightBarButton(leftBarButton, animated: true)
    }
    
    @objc private func popButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
