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
    let data = [["title": "Delegate", "vc": "MySecondViewController"],
                ["title": "Closure", "vc": "MySecondViewController"],
                ["title": "Notification", "vc": "MySecondViewController"],
                ["title": "UserDefaults", "vc": "MySecondViewController"]]
    var operation = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if operation == "UserDefaults" {
            //首先获取NSUserDefaults的对象
            let userDefaults = UserDefaults.standard
            //读取出数据
            let si = userDefaults.object(forKey: "selectedIndex")
            //然后修改ViewController中的label的文字
            self.infoLabel.text = si as? String
            userDefaults.set("", forKey: "selectedIndex")
            userDefaults.synchronize()
        }
    }
    @objc func addNotification() -> Void {
        //添加通知
        NotificationCenter.default.addObserver(self, selector: #selector(notificationValue(_:)), name: NSNotification.Name(rawValue: "sendValue"), object: nil)
    }
    //事件,此时secLabel是用来显示通知传递来的值，此不在赘述
    @objc func notificationValue(_ notification:Notification) {
        self.infoLabel.text = notification.object as! String?
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "sendValue"), object: nil)
    }
    
    func makeInterface() -> Void {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: infoLabel.frame.origin.y+infoLabel.frame.size.height + 20, width: self.view.frame.size.width, height: self.view.frame.size.height-infoLabel.frame.size.height), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        tableView.backgroundColor = UIColor.purple
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    @IBAction func gotoSecond(_ sender: Any) {
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

extension MyFirstViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.backgroundColor = UIColor.randomColor
        cell.textLabel?.text = self.data[indexPath.row]["title"]
        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let title = self.data[indexPath.row]["title"]
        let name = self.data[indexPath.row]["vc"]!
        HYLog("\(title!), \(name)")
        self.operation = title!
        //动态获取命名空间
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        HYLog(namespace)
        //注意工程中必须有相关的类，否则程序会crash
        let classOf: AnyObject = NSClassFromString(namespace + "." + name)!
        HYLog(classOf)
        // 告诉编译器它的真实类型
        let viewControllerClass = classOf as! HYBaseViewController.Type
        let vc = viewControllerClass.init()
        HYLog(vc)
        vc.title = title!
//        let sel = #selector(configTranfer(_:))
//        class_respondsToSelector(viewControllerClass, #selector(configTranfer(_:)))
////        let vc = MySecondViewController.init()
        if title == "Delegate" {
//            if vc.supplementalTarget(forAction: #selector(setDelegate:), sender: nil) {
//            }
//            vc.delegate = self
        } else if title == "Closure" {
//            vc.callBack { (value) in
//                self.infoLabel.text = value
//            }
        } else if title == "Notification" {
            addNotification()
        } else if title == "UserDefaults" {
//            vc.transfer = title
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
