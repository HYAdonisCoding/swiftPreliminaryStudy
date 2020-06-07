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
    
    func callBack(closure: Closure!) -> Void {
        self.closure = closure
    }
//
//    init(block: @escaping InfoBlock) {
//        self.block = block
//        super.init(nibName: "Main", bundle: nil)
//    }
//    init() {
//        super.init(nibName: "Main", bundle: nil)
//        self.block("20")
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Input"
        
        // Do any additional setup after loading the view.
    }
    
    deinit {
        if let delegate = self.delegate {
            delegate.viewController!(self, dismissWithValue:"321")
        }
        if let closure = self.closure {
            closure("123456")
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
