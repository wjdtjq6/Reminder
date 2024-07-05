//
//  RegisterViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import UIKit
import SnapKit
import RealmSwift
import Toast

class RegisterViewController: UIViewController {
    let uiView = UIView()
    let titleTextfield = UITextField()
    let separator = UIView()
    let contentTextfield = UITextView()
    let tableView = UITableView()
    
    let realm = try! Realm()
    
    var getDate = ""
    var getTagText = ""
    var getSegment = 611
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        print(realm.configuration.fileURL)
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func configureHierarchy() {
        view.addSubview(uiView)
        view.addSubview(separator)
        view.addSubview(titleTextfield)
        view.addSubview(contentTextfield)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: RegisterTableViewCell.id)
    }
    func configureLayout() {
        uiView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(200)
        }
        titleTextfield.snp.makeConstraints { make in
            make.top.equalTo(uiView.snp.top)//.inset(10)
            make.leading.equalTo(uiView.snp.leading).inset(10)
            make.height.equalTo(50)
            make.width.equalTo(360)
        }
        separator.snp.makeConstraints { make in
            make.top.equalTo(titleTextfield.snp.bottom)
            make.leading.equalTo(uiView.snp.leading).inset(10)
            make.width.equalTo(350)
            make.height.equalTo(1)
        }
        contentTextfield.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom)
            make.leading.equalTo(uiView.snp.leading).inset(5)
            make.height.equalTo(150)
            make.width.equalTo(365)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(uiView.snp.bottom)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(view)
        }
        
    }
    func configureUI() {
        view.backgroundColor = .black
        navigationItem.title = "새로운 할 일"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        let cancleBarButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancleBarButtonClicked))
        navigationItem.leftBarButtonItem = cancleBarButton
        let addBarButton = UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(addBarButtonClicked))
        navigationItem.rightBarButtonItem = addBarButton
        
        uiView.backgroundColor = .darkGray
        uiView.layer.cornerRadius = 10
        titleTextfield.attributedPlaceholder = NSAttributedString(string: "제목", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        titleTextfield.textColor = .lightGray
        titleTextfield.font = .systemFont(ofSize: 13)
        separator.backgroundColor = .lightGray
        contentTextfield.backgroundColor = .clear
        contentTextfield.text = "메모"
        contentTextfield.delegate = self
        contentTextfield.textAlignment = .left
        contentTextfield.textColor = .lightGray
        tableView.backgroundColor = .clear
        

    }
    @objc func cancleBarButtonClicked() {
        dismiss(animated: true)
    }
    @objc func addBarButtonClicked() {
        print(#function)
        //1.텍스트필드에 작성한 텍스트가 저장되도록 수정
        //2.제목이 비어있다면(isEmpty) 저장 되지 않고 얼럿 띄우기
        //3.저장 완료 이후에는 메인 화면으로 전환
        
        //create 1.Realm 위치 찾기
        let realm = try! Realm()
        guard let title = titleTextfield.text, !title.isEmpty, let content = contentTextfield.text else {
            view.makeToast("제목을 입력해주세요")
            return
        }
        //2.
        let data = Todo(title: title, content: content, date: getDate, tag: getTagText, priority: getSegment)
        //3.
        try! realm.write {
            realm.add(data)
            print("Realm Creat Success")
        }
        dismiss(animated: true)
    }
}
extension RegisterViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        contentTextfield.text = ""
    }
}
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: let vc = DateViewController()
            vc.setedDate = { value in
                self.getDate = value
            }
            navigationController?.pushViewController(vc, animated: true)
        case 1: let vc = TagViewController()
            vc.tagText = { value in
                self.getTagText = value
            }
            navigationController?.pushViewController(vc, animated: true)
        case 2: let vc = PriorityViewController()
            vc.segmentInt = { value in
                self.getSegment = value
            }
            navigationController?.pushViewController(vc, animated: true)
        case 3: let vc = PHPickerViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("error")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterTableViewCell.id, for: indexPath) as! RegisterTableViewCell
        cell.backgroundColor = .clear
        switch indexPath.row {
        case 0: cell.uiLabel.text = "마감일"
            cell.rightLabel.text = getDate
        case 1: cell.uiLabel.text = "태그"
            cell.rightLabel.text = getTagText
        case 2: cell.uiLabel.text = "우선 순위"
            var getSegmentString = ""
            if getSegment == 0 {
            getSegmentString = "높음" }
            else if getSegment == 1 {
                getSegmentString = "보통" }
            else if getSegment == 2 {
                getSegmentString = "낮음" }
            else {
                getSegmentString = ""
            }
            cell.rightLabel.text = "\(getSegmentString)"
        case 3: cell.rightLabel.text = ""
            cell.uiLabel.text = "이미지 추가"
        default:
            cell.uiLabel.text = "아몰랑"
        }
        return cell
    }
    
    
}
