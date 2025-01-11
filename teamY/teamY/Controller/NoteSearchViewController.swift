//
//  NoteSearchViewController.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class NoteSearchViewController: UIViewController {
    // 임시 데이터
    private let data: [NoteSearchModel] = [
        NoteSearchModel(image: UIImage(), name: "[스타벅스] 아이스 아메리카노"),
        NoteSearchModel(image: UIImage(), name: "[메가커피] 아이스 아메리카노")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.view = noteSearchView
    }
    
    private lazy var noteSearchView: NoteSearchView = {
        let view = NoteSearchView()
        view.noteSearchTableView.delegate = self
        view.noteSearchTableView.dataSource = self
        return view
    }()

}

extension NoteSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteSearchCell.identifier, for: indexPath) as? NoteSearchCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}
