//
//  ListTableViewCell.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    static let id = "ListTableViewCell"
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let dateLabel = UILabel()
    let hashtagLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(hashtagLabel)
    }
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(titleLabel.snp.bottom).offset(5)
            make.leading.lessThanOrEqualTo(contentView.safeAreaLayoutGuide).offset(5)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(contentLabel.snp.bottom).offset(5)
            make.leading.lessThanOrEqualTo(contentView.safeAreaLayoutGuide).offset(5)
        }
        hashtagLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(contentLabel.snp.bottom).offset(5)
            make.leading.lessThanOrEqualTo(dateLabel.snp.trailing).offset(5)
//            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
//            make.width.equalTo(40)
//            make.height.equalTo(10)
        }
        
    }
    func configureUI() {
        titleLabel.textColor = .white
        contentLabel.textColor = .lightGray
        contentLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 12)
        hashtagLabel.textColor = .systemBlue
        hashtagLabel.font = .systemFont(ofSize: 12)
        hashtagLabel.textAlignment = .center
    }
}
