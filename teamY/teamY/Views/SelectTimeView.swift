//
//  SelectTimeView.swift
//  teamY
//
//  Created by 이수현 on 1/11/25.
//

import UIKit

class SelectTimeView: UIView {
    
    // 타이틀
    private let lblTitle = UILabel().then { lbl in
        lbl.text = "오늘 몇 시에 주무실 예정인가요?"
        lbl.font = .ptdSemiBoldFont(ofSize: 18)
        lbl.textAlignment = .center
    }
    
    // 시간 선택 그룹
    private let grpSelectTime = UIView()
    
    // 달 이미지뷰
    private let imageView = UIImageView().then { view in
        view.image = .init(systemName: "moon.fill")
        view.tintColor = .mainColor
    }
    
    // 시간 선택 데이트피커
    public let datePicker = UIDatePicker().then { picker in
        picker.datePickerMode = .time
        picker.layer.cornerRadius = 10
        picker.layer.borderColor = UIColor.mainColor?.cgColor
        picker.layer.borderWidth = 0.7
        picker.locale = Locale(identifier: "ko-KR_POSIX")
    }
    
//    public let timeDropDown = UIDrop
    
    // -시
    private let lblTime = UILabel().then { lbl in
        lbl.text = "시"
        lbl.textColor = .mainColor
        lbl.font = .ptdMediumFont(ofSize: 18)
    }
    
    // 다음 버튼
    public let btnNext = CustomButton().then { btn in
        btn.configure(title: "다음", titleColor: .white, radius: 10, backgroundColor: .mainColor ?? .tintColor, isEnabled: true)
        btn.titleLabel?.font = .ptdSemiBoldFont(ofSize: 18)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .background
        setSubView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubView() {
        [
            imageView,
            datePicker,
            lblTime
        ].forEach{grpSelectTime.addSubview($0)}
        
        [
            lblTitle,
            grpSelectTime,
            btnNext
        ].forEach{self.addSubview($0)}
    }
    
    private func setUI(){
        // "오늘 몇 시에 주무실 건가요" 라벨
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(32)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        grpSelectTime.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(90)
            make.height.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(44)
        }
        
        // 데이트피커
        datePicker.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.verticalEdges.equalToSuperview()
//            make.centerX.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(47)
        }
        
        // 달 모양 이미지뷰
        imageView.snp.makeConstraints { make in
//            make.trailing.equalTo(datePicker.snp.leading)
            make.leading.equalToSuperview()
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        // -시
        lblTime.snp.makeConstraints { make in
            make.leading.equalTo(datePicker.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        // 다음 버튼
        btnNext.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(76)
            make.height.equalTo(52)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}
