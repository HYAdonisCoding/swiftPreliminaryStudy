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
        

        print("\(self) \(#function) \(getCuttentTime())")
        self.view.backgroundColor = UIColor.systemTeal
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("\(self) \(#function) \(getCuttentTime())")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self) \(#function) \(getCuttentTime())")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(self) \(#function) \(getCuttentTime())")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(self) \(#function) \(getCuttentTime())")
    }
        
    /// 获取时间
    func getCuttentTime() -> String {

        let dateformatter = DateFormatter()

        dateformatter.dateFormat = "YYYY-MM-dd HH:mm:ss"// 自定义时间格式

        let time = dateformatter.string(from: Date())
        return time
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
