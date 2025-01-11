//
//  NoteDetailViewController.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class NoteDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = noteDetailView
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private lazy var noteDetailView: NoteDetailView = {
        let view = NoteDetailView()
        return view
    }()
}
