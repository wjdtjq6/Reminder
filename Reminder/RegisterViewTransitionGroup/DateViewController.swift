//
//  DateViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/3/24.
//

import UIKit
import SnapKit
class DateViewController: UIViewController {
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.locale = Locale(identifier: "ko-KR")
        //picker.maximumDate = Date()
        return picker
    }()
    let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    var setedDate: ((String) -> Void)?
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        setedDate?(dateFormatter.string(from: datePicker.date))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    func configureHierarchy() {
        view.addSubview(datePicker)
        view.addSubview(containerStackView)
    }
    func configureLayout() {
        datePicker.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureUI() {
        view.backgroundColor = .white
    }
}
