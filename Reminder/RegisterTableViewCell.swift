//
//  RegisterTableViewCell.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    let textfield = UITextField()
    static let id = "RegisterTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .darkGray
        contentView.addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(10)
        }
        textfield.textColor = .white
        textfield.font = .boldSystemFont(ofSize: 13)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
