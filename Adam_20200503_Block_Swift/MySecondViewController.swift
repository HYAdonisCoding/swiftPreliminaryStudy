//
//  MySecondViewController.swift
//  Adam_20200503_Block_Swift
//
//  Created by Adam on 2020/5/3.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit



@objc protocol SecondViewControllerDelegate {
    @objc optional func viewController(_ viewController: MySecondViewController, dismissWithValue value: String) -> Void
}

class MySecondViewController: HYBaseViewController {
    @IBOutlet weak var textField: UITextField!
    
    // 2、声明协议属性

    weak var delegate: SecondViewControllerDelegate?
    typealias Closure = (String) -> Void
    
    var closure: Closure?
    
    var transfer: String?
    
    func callBack(closure: Closure!) -> Void {
        self.closure = closure
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.title
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        let tag = Int.randomIntNumber(lower: 1, upper: 100)
        if let delegate = self.delegate {
            delegate.viewController!(self, dismissWithValue:"代理回传 - 序号:\(tag)")
        }
        else if let closure = self.closure {
            closure("闭包回传 - 序号:\(tag)")
        }
        else if self.transfer == "UserDefaults" {
            let userDefaults = UserDefaults.standard
            //数据记录
            
            let selectedIndex = "UserDefaults 回传数据 - 序号:\(tag)"
            //写入plist文件
            userDefaults.set(selectedIndex, forKey: "selectedIndex")
            //回写文件
            userDefaults.synchronize()
        }
        else {
            NotificationCenter.default.post(name: NSNotification.Name.init("sendValue"), object: "通知传递过来的值 - 序号:\(tag)")
        }
    }

    @IBAction func doneAction(_ sender: Any) {
//        self.block("20")
        // 3、判断代理是否存在，如果代理存在则让代理执行协议方法并且将数据传递给代理
        if let delegate = self.delegate {
            delegate.viewController!(self, dismissWithValue:"123")
        }

        self.navigationController?.popViewController(animated: true)
    }
    
}
