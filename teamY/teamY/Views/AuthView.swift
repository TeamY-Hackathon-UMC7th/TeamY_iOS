//
//  AuthView.swift
//  teamY
//
//  Created by 김도연 on 1/11/25.
//
public let ScreenHeight = UIScreen.main.bounds.height
import UIKit
import SnapKit
import Then

class AuthView: UIView {
    
    lazy var logoImageView = UIImageView().then {
        $0.image = UIImage(systemName: "cup.and.heat.waves.fill")?.withRenderingMode(.alwaysTemplate)
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .brown
    }
    
    private let descriptionlabel = UILabel().then {
        $0.text = "사용할 닉네임을 입력해주세요"
        $0.textColor = .black
        $0.font = UIFont.ptdMediumFont(ofSize: 14)
    }
    
    lazy var nickNameField = CustomTextFieldView(
        descriptionImageIcon: "coffee",
        textFieldPlaceholder: "닉네임을 입력해주세요",
        validationText: "사용할 수 없는 닉네임입니다."
    ).then {
        $0.textField.keyboardType = .default
    }
    
    private let checkButton = CustomButton(
        backgroundColor: .gray,
        title: "확인",
        titleColor: .white,
        radius: 10,
        isEnabled: false
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()

        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [logoImageView, descriptionlabel, nickNameField, checkButton].forEach {
            addSubview($0)
        }
    }

    private func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80) // 상단 여백
            make.width.height.equalTo(100)
        }
        descriptionlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
        }

        nickNameField.snp.makeConstraints { make in
            make.top.equalTo(descriptionlabel.snp.bottom).offset(58)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }

        checkButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
            make.bottom.equalToSuperview().inset(ScreenHeight * 0.1)
        }
    }
}
