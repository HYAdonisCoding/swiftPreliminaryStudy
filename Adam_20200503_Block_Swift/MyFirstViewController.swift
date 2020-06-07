//
//  ViewController.swift
//  Adam_20200503_Block_Swift
//
//  Created by Adam on 2020/5/3.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit

class MyFirstViewController: HYBaseViewController {
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoSecond(_ sender: Any) {
//        let sb = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "MySecondViewController")
        
//        let vc = MySecondViewController.init { (str) in
//            self.infoLabel.text = str
//        }
        let vc = MySecondViewController.init()
//        vc.delegate = self
        vc.callBack { (value) in
            self.infoLabel.text = value
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension MyFirstViewController: SecondViewControllerDelegate {
    func viewController(_ viewController: MySecondViewController, dismissWithValue value: String) {
        self.infoLabel.text = value
    }
}
