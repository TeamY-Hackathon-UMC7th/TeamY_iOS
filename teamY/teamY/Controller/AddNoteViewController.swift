//
//  AddNoteViewController.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class AddNoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = addNoteView
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "새 기록"
    }
    
    private lazy var addNoteView: AddNoteView = {
        let view = AddNoteView()
        return view
    }()

}
