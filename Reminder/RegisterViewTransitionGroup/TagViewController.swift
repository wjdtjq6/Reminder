//
//  TagViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/3/24.
//

import UIKit

class TagViewController: UIViewController {
    let textField = UITextField()
    var tagText: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        textField.textColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Tag를 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.textAlignment = .center
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tagText?(textField.text ?? "nil")
    }
}
