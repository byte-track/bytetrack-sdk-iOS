//
//  ViewController.swift
//  bytetrackDemo_Swift
//
//  Created by 孙良 on 2022/9/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.width
        let btn = UIButton(frame: CGRect(x: screenWidth/2.0-50, y: 200,  width: 100, height: 100))
        btn.setTitle("打开信使", for: .normal)
        btn.setTitleColor(UIColor.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        view.addSubview(btn)
        // Do any additional setup after loading the view.
    }

     @objc func btnClicked(){
        Bytetrack.presentMessenger()//打开信使
       }
}

