//
//  NoteSearchCell.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class NoteSearchCell: UITableViewCell {
    static let identifier = "NoteSearchCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        self.title.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var image = UIImageView().then {
        $0.backgroundColor = UIColor(hex: "#D9D9D9")
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var title = UILabel().then {
        $0.font = UIFont.ptdMediumFont(ofSize: 14)
        $0.textColor = .black
    }
    
    private func setupView() {
        [
            image,
            title
        ].forEach {
            contentView.addSubview($0)
        }
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.height.equalTo(64)
        }
        
        title.snp.makeConstraints {
            $0.centerY.equalTo(image.snp.centerY)
            $0.leading.equalTo(image.snp.trailing).offset(12)
        }
    }
    
    public func configure(model: NoteSearchModel) {
        // self.image.image = model.image
        self.title.text = model.name
    }
}

