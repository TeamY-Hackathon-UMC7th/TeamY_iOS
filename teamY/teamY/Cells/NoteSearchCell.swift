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
    
    public lazy var title = UILabel().then {
        $0.attributedText = NSAttributedString(string: "", attributes: [.font: UIFont.ptdMediumFont(ofSize: 14)])
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
    
    public func configure(model: NoteSearchModel, highlightText: String? = nil) {
        // self.image.image = model.image
        self.title.text = model.name
        
        
        //하이라이트 적용
        if let highlightText = highlightText, !highlightText.isEmpty {
            title.attributedText = highlightTextInLabel(text: model.name, highlight: highlightText)
        } else {
            title.text = model.name
        }
    }
    
    private func highlightTextInLabel(text: String, highlight: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text.lowercased() as NSString).range(of: highlight.lowercased())
        if range.location != NSNotFound {
            attributedString.addAttribute(.foregroundColor, value: UIColor.mainColor!, range: range)
        }
        return attributedString
    }
    
    public func setSelectedBorder(isSelected: Bool) {
        self.layer.borderWidth = isSelected ? 0.7 : 0
        self.layer.cornerRadius = isSelected ? 10 : 0
        self.layer.borderColor = isSelected ? UIColor.mainColor?.cgColor : UIColor.clear.cgColor
    }
}

