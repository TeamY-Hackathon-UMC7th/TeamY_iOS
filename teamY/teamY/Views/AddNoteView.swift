//
//  AddNoteView.swift
//  teamY
//
//  Created by 주민영 on 1/11/25.
//

import UIKit

class AddNoteView: UIView, UITextViewDelegate {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.background
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var reviewTitle = UILabel().then {
        $0.font = UIFont.ptdMediumFont(ofSize: 16)
        $0.textColor = .mainColor
        $0.text = "후기"
    }
    
    let textViewPlaceHolder = "어제는 어땟나요?"
    
    private lazy var reviewTextView = UITextView().then {
        $0.font = UIFont.ptdRegularFont(ofSize: 14)
        $0.textColor = .mainColor
        $0.textAlignment = .left
        $0.backgroundColor = UIColor(hex: "#FFFBF8")
        
        $0.isEditable = true
        $0.isScrollEnabled = true
        $0.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        $0.layer.borderColor = UIColor.mainColor?.cgColor
        $0.layer.borderWidth = 0.7
        $0.layer.cornerRadius = 10
        
        $0.text = textViewPlaceHolder
        $0.textColor = .lightGray
        $0.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .mainColor
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
    
    private lazy var saveBtn = CustomButton(
        backgroundColor: .mainColor!,
        title: "저장하기",
        titleColor: .white,
        radius: 10,
        isEnabled: true
    )
    
    private func setupView() {
        let stack1 = createCustomStack(iconName: "coffee_fill", titleText: "마신 일시", isPicker: true)
        let stack2 = createCustomStack(iconName: "moon_fill", titleText: "취침 일시", isPicker: true)
        let stack3 = createCustomStack(iconName: "coffee-bean_fill", titleText: "마신 메뉴", isPicker: false)
        
        let mainStack = UIStackView(arrangedSubviews: [stack1, stack2, stack3]).then {
            $0.axis = .vertical
            $0.spacing = 30
            $0.alignment = .fill
            $0.distribution = .equalSpacing
        }
        
        [
            mainStack,
            reviewTitle,
            reviewTextView,
            saveBtn
        ].forEach {
            addSubview($0)
        }
        
        mainStack.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(50)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
        }
        
        reviewTitle.snp.makeConstraints {
            $0.top.equalTo(mainStack.snp.bottom).offset(30)
            $0.leading.equalTo(mainStack.snp.leading)
        }
        
        reviewTextView.snp.makeConstraints {
            $0.top.equalTo(reviewTitle.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(32)
            $0.trailing.equalToSuperview().offset(-32)
            $0.height.equalTo(250)
        }
        
        saveBtn.snp.makeConstraints {
            $0.top.equalTo(reviewTextView.snp.bottom).offset(86)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(52)
        }
    }
    
    func createCustomStack(iconName: String, titleText: String, isPicker: Bool) -> UIStackView {
        let icon = UIImageView().then {
            $0.image = UIImage(named: iconName)
            $0.contentMode = .scaleAspectFit
        }

        let title = UILabel().then {
            $0.font = UIFont.ptdMediumFont(ofSize: 16)
            $0.textColor = .mainColor
            $0.text = titleText
        }
        
        var stack = UIStackView()

        if (isPicker) {
            let dateTimePicker = UIDatePicker().then {
                $0.datePickerMode = .dateAndTime
                $0.backgroundColor = .clear
                $0.tintColor = .action
                $0.locale = Locale(identifier: "ko_KR")
            }
            
            stack = UIStackView(arrangedSubviews: [icon, title, dateTimePicker]).then {
                $0.axis = .horizontal
                $0.spacing = 10
                $0.alignment = .fill
                $0.distribution = .fill
            }
        } else {
            let textField = UITextField().then {
                $0.font = UIFont.ptdMediumFont(ofSize: 16)
                $0.textColor = .mainColor
                $0.textAlignment = .left
                $0.backgroundColor = UIColor(hex: "#FFFBF8")
                
                $0.layer.borderColor = UIColor.mainColor?.cgColor
                $0.layer.borderWidth = 0.7
                $0.layer.cornerRadius = 10
                
                $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
                $0.leftViewMode = .always
                $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
                $0.rightViewMode = .always
            }
            
            textField.snp.makeConstraints {
                $0.width.equalTo(194)
                $0.height.equalTo(40)
            }
            
            stack = UIStackView(arrangedSubviews: [icon, title, textField]).then {
                $0.axis = .horizontal
                $0.spacing = 10
                $0.alignment = .fill
                $0.distribution = .fill
            }
        }
        
        stack.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        icon.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }

        return stack
    }
}
