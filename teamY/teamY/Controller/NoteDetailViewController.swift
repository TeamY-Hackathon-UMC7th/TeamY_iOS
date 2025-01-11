//
//  NoteDetailViewController.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class NoteDetailViewController: UIViewController {
    public var receivedData: NoteModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = noteDetailView
        self.navigationController?.isNavigationBarHidden = false
        
        if let data = receivedData {
            noteDetailView.coffeeName.text = data.coffeeName
            noteDetailView.drinking.text = "마신 일시 | " + data.drinkingDate + " " + data.drinkingTime
            noteDetailView.sleeping.text = "취침 시간 | " + data.sleepingDate + " " + data.sleepingTime
            noteDetailView.reviewContents.text = data.review
        }
    }
    
    private lazy var noteDetailView: NoteDetailView = {
        let view = NoteDetailView()
        return view
    }()
}
