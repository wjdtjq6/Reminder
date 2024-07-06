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
    let priorityLabel = UILabel()
    let uiImageView = UIImageView()
    let completeButton = UIButton()
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
        contentView.addSubview(priorityLabel)
        contentView.addSubview(uiImageView)
        contentView.addSubview(completeButton)
    }
    func configureLayout() {
        completeButton.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
        priorityLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(completeButton.snp.trailing).offset(5)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(priorityLabel.snp.trailing).offset(3)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(titleLabel.snp.bottom).offset(5)
            //make.leading.lessThanOrEqualTo(contentView.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(completeButton.snp.trailing).offset(5)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(contentLabel.snp.bottom).offset(5)
           // make.leading.lessThanOrEqualTo(contentView.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(completeButton.snp.trailing).offset(5)
        }
        hashtagLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(contentLabel.snp.bottom).offset(5)
            make.leading.lessThanOrEqualTo(dateLabel.snp.trailing).offset(5)
        }
        uiImageView.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.height.equalTo(75)
            make.width.equalTo(75)
        }
    }
    func configureUI() {
        priorityLabel.textColor = .systemBlue
        titleLabel.textColor = .white
        contentLabel.textColor = .lightGray
        contentLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 12)
        hashtagLabel.textColor = .systemBlue
        hashtagLabel.font = .systemFont(ofSize: 12)
        hashtagLabel.textAlignment = .center
        completeButton.setImage(UIImage(systemName: "circle"), for: .normal)
    }
}
