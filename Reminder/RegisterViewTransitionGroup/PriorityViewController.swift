//
//  PriorityViewController.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/3/24.
//

import UIKit

class PriorityViewController: UIViewController {
    let segmentcontroll = UISegmentedControl(items: ["높음","보통","낮음"])
    var segmentInt: ((Int) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        view.addSubview(segmentcontroll)
        segmentcontroll.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        segmentcontroll.backgroundColor = .lightGray
    }
    override func viewWillDisappear(_ animated: Bool) {
        print(segmentcontroll.selectedSegmentIndex)
        segmentInt?(segmentcontroll.selectedSegmentIndex)
    }
}
