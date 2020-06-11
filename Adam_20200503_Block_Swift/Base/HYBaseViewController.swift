//
//  HYBaseViewController.swift
//  Adam_20200503_Block_Swift
//
//  Created by Adam on 2020/6/6.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit

class HYBaseViewController: UIViewController {

//    init() {
//        super.init()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        HYLog("\(self.classForCoder) | coming...")
        self.view.backgroundColor = UIColor.systemTeal
        // Do any additional setup after loading the view.
    }
    
    deinit {
        HYLog("\(self.classForCoder) | leaved...")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        HYLog("\(self.classForCoder) | coming...")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        HYLog("\(self.classForCoder) | leaving...")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        HYLog("\(self.classForCoder) | leaved...")
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
