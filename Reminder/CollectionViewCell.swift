//
//  CollectionViewCell.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/6/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let uiView = UIView()
    let uiImage = UIImageView()
    let underLabel =  UILabel()
    let numberLabel = UILabel()
    static var id = "CollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    func configureHierarchy() {
        contentView.addSubview(uiView)
        contentView.addSubview(uiImage)
        contentView.addSubview(underLabel)
        contentView.addSubview(numberLabel)
    }
    func configureLayout() {
        uiView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        uiImage.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
            make.width.height.equalTo(40)
        }
        underLabel.snp.makeConstraints { make in
            make.top.equalTo(uiImage.snp.bottom).offset(5)
            make.leading.equalTo(contentView).offset(15)
        }
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(10)
            make.trailing.equalTo(contentView).inset(15)
        }
    }
    func configureUI() {
        uiView.backgroundColor = .darkGray
        uiView.layer.masksToBounds = true
        uiView.layer.cornerRadius = 20
        uiImage.layer.masksToBounds = true
        uiImage.layer.cornerRadius = 20
        uiImage.tintColor = .white
        uiImage.contentMode = .center
        underLabel.textColor = .lightGray
        underLabel.font = .systemFont(ofSize: 14)
        numberLabel.font = .boldSystemFont(ofSize: 30)
        numberLabel.textColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
