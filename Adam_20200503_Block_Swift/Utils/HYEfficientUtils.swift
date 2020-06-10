//
//  HYEfficientUtils.swift
//  Adam_20200503_Block_Swift
//
//  Created by Adam on 2020/6/8.
//  Copyright © 2020 Adam. All rights reserved.
//

import Foundation
import UIKit

public extension Int {
    /*这是一个内置函数
     lower : 内置为 0，可根据自己要获取的随机数进行修改。
     upper : 内置为 UInt32.max 的最大值，这里防止转化越界，造成的崩溃。
     返回的结果： [lower,upper) 之间的半开半闭区间的数。
     */
    static func randomIntNumber(lower: Int = 0,upper: Int = Int(UInt32.max)) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower)))
    }
    /**
     生成某个区间的随机数
     */
    static func randomIntNumber(range: Range<Int>) -> Int {
        return randomIntNumber(lower: range.lowerBound, upper: range.upperBound)
    }
}
/**
 单精度的随机数
 */
public extension Float {
    static func randomFloatNumber(lower: Float = 0,upper: Float = 100) -> Float {
        return (Float(arc4random()) / Float(UInt32.max)) * (upper - lower) + lower
    }
}
/**
 CGFloat 类型的随机数
 */
public extension CGFloat {
    static func randomCGFloatNumber(lower: CGFloat = 0,upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (upper - lower) + lower
    }
}

/**
 双精度的随机数
 */
public extension Double {
    static func randomDoubleNumber(lower: Double = 0,upper: Double = 100) -> Double {
          return (Double(arc4random())/Double(UInt32.max))*(upper - lower) + lower
    }
}

public extension UIColor {
//返回随机颜色
class var randomColor: UIColor {
    get {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
}
