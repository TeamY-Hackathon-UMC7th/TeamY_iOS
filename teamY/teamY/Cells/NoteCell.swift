//
//  NoteCell.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class NoteCell: UITableViewCell {
    static let identifier = "NoteCell"
    
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
        self.title.text = nil
        self.subTitle.text = nil
        self.drinkingDate.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
    }
    
    let last = UIView().then {
        $0.backgroundColor = UIColor(hex: "#EE633A")
        $0.layer.cornerRadius = 4
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner]
        $0.isHidden = true
    }
    
    let lastLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.font = UIFont.ptdSemiBoldFont(ofSize: 10)
        $0.text = "라스트 커피"
    }
    
    private lazy var image = UIImageView().then {
        $0.image = UIImage(named: "coffee-mug")
        $0.contentMode = .scaleAspectFit
    }
    
    private lazy var title = UILabel().then {
        $0.font = UIFont.ptdMediumFont(ofSize: 16)
        $0.textColor = .black
    }
    
    private lazy var subTitle = UILabel().then {
        $0.font = UIFont.ptdRegularFont(ofSize: 14)
        $0.textColor = UIColor(hex: "#8E8E8E")
    }
    
    private lazy var titleStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 3
    }
    
    private lazy var drinkingDate = UILabel().then {
        $0.font = UIFont.ptdRegularFont(ofSize: 12)
        $0.textColor = UIColor(hex: "#8E8E8E")
    }
    
    private func setupView() {
        contentView.addSubview(containerView)
        titleStackView.addArrangedSubview(title)
        titleStackView.addArrangedSubview(subTitle)
        
        [
            last,
            image,
            titleStackView,
            drinkingDate
        ].forEach {
            containerView.addSubview($0)
        }
        
        last.addSubview(lastLabel)
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.08
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
        }
        
        last.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.equalTo(66)
            $0.height.equalTo(18)
        }
        
        lastLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(27)
            $0.leading.equalToSuperview().offset(32)
            $0.bottom.equalToSuperview().offset(-27)
            $0.width.height.equalTo(26)
        }
        
        titleStackView.snp.makeConstraints {
            $0.centerY.equalTo(image.snp.centerY)
            $0.leading.equalTo(image.snp.trailing).offset(30)
        }
        
        drinkingDate.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    
    public func configure(model: NoteModel) {
        self.title.text = model.coffeeName
        self.subTitle.text = model.drinkingTime + "시 마심 | " + model.sleepingTime + "시 취침"
        self.drinkingDate.text = model.drinkingDate
    }
}
