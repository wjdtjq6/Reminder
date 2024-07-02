//
//  ViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//            let leftBarButton = UIBarButtonItem(title: "새로운 할 일", image: UIImage(systemName: "plus.circle.fill"), target: self, action: #selector(leftBarButtonClicked))
//            navigationItem.leftBarButtonItem = leftBarButton
        let rightBarButton = UIBarButtonItem(title: "목록 추가", style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    @objc func leftBarButtonClicked() {
        print(#function)
    }
    @objc func rightBarButtonClicked() {
        print(#function)
    }

}

