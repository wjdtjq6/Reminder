//
//  ListViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import UIKit
import SnapKit
import RealmSwift
class ListViewController: UIViewController {
    let tableView = UITableView()
    var list: Results<Todo>!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        list = realm.objects(Todo.self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func configureHierarchy() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.id)
    }
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureUI() {
        let firstRightBarButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(firstBarButtonClicked))
        let secondRightBarButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(SecondBarButtonClicked))
        navigationItem.rightBarButtonItems = [secondRightBarButton, firstRightBarButton]
        tableView.backgroundColor = .black
        tableView.rowHeight = 80
    }
    @objc func firstBarButtonClicked() {
        print(#function)
        let vc = RegisterViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen

        present(nav, animated: true)
    }
    @objc func SecondBarButtonClicked() {
        print(#function)
    }
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "전체"
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        tableView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let totalLabel = UILabel()
        headerView.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.width.equalTo(60)
        }
        totalLabel.text = "전체"
        totalLabel.textColor = .systemBlue
        totalLabel.font = .boldSystemFont(ofSize: 30)
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.id, for: indexPath) as! ListTableViewCell
        cell.backgroundColor = .black
        let data = list[indexPath.row]
        cell.titleLabel.text = data.title//"키보드 구매"
        cell.contentLabel.text = data.content//"예쁜 키캡 알아보기"
        cell.dateLabel.text = "\(data.date)"//"\(Date.now)"//String(Date.now)
        cell.hashtagLabel.text = "#쇼핑"

        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: nil) { action, view, completionHandler in
            try! self.realm.write {
                self.realm.delete(self.list[indexPath.row])
                tableView.reloadData()            }
            }
        delete.backgroundColor = .red
        delete.title = "삭제"
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
