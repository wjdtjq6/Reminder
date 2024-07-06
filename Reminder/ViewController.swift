//
//  ViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let leftTabButton = UIButton()
    let rightTabButton = UIButton()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    var today = Date.now
    
    var list: Results<Todo>!
    let realm = try! Realm()
    
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - 60
        layout.itemSize = .init(width: width/2, height: width/4)
        layout.minimumLineSpacing = 15
        layout.minimumLineSpacing = 15
        layout.sectionInset = .zero
        return layout
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        print(list)
    }
    func configureHierarchy() {
        view.addSubview(leftTabButton)
        view.addSubview(rightTabButton)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
    }
    func configureLayout() {
        leftTabButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        rightTabButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(300)
        }
    }
    func configureUI() {
        view.backgroundColor = .black
        leftTabButton.setTitle(" 새로운 할 일", for: .normal)
        leftTabButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        leftTabButton.addTarget(self, action: #selector(leftTabButtonClicked), for: .touchUpInside)
        leftTabButton.setTitleColor(.systemBlue, for: .normal)
        rightTabButton.setTitle("목록 추가", for: .normal)
        rightTabButton.addTarget(self, action: #selector(rightTabButtonClicked), for: .touchUpInside)
        rightTabButton.setTitleColor(.systemBlue, for: .normal)
        collectionView.backgroundColor = .clear
        let RightBarButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.rightBarButtonItem = RightBarButton
    }
    @objc func rightBarButtonClicked() {
        print(#function)
    }
    @objc func leftTabButtonClicked() {
        let vc = RegisterViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen

        present(nav, animated: true)
    }
    @objc func rightTabButtonClicked() {
        print(#function)
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0: print("나나중에")
        case 1: print("나나중에")
        case 2: let vc = ListViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3: print("나나중에")
        case 4: print("나나중에")
        default:
            print("나나중에")
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let dateString = dateFormatter.string(from: today)
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20)
        switch indexPath.item {
        case 0: cell.uiImage.image = UIImage(systemName: "\(dateString).square",withConfiguration: imageConfig)
            cell.uiImage.backgroundColor = .systemBlue
            cell.underLabel.text = "오늘"
            cell.numberLabel.text = "0"
        case 1: cell.uiImage.image = UIImage(systemName: "calendar",withConfiguration: imageConfig)
            cell.uiImage.backgroundColor = .systemRed
            cell.underLabel.text = "예정"
            cell.numberLabel.text = "0"
        case 2: cell.uiImage.image = UIImage(systemName: "tray.fill",withConfiguration: imageConfig)
            cell.uiImage.backgroundColor = .systemGray
            cell.underLabel.text = "전체"
            cell.numberLabel.text = "\(list?.count ?? 0)"
        case 3: cell.uiImage.image = UIImage(systemName: "flag.fill",withConfiguration: imageConfig)
            cell.uiImage.backgroundColor = .systemYellow
            cell.underLabel.text = "깃발 표시"
            cell.numberLabel.text = "0"
        case 4: cell.uiImage.image = UIImage(systemName: "checkmark",withConfiguration: imageConfig)
            cell.uiImage.backgroundColor = .systemGray2
            cell.underLabel.text = "완료됨"
            cell.numberLabel.text = "0"
        default:
            print("나중에")
        }
        return cell
    }
    
    
}
