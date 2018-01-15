//
//  Helper.swift
//  tableView
//
//  Created by 段桥 on 2018/1/11.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit
import Foundation

class Helper: NSObject {
    
 public func colorValue(_ colorString:String? , alpha:CGFloat?) -> UIColor {
    var color:UIColor!
    var cString:String!
    //删除字符串中的空格
    cString = colorString?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    if cString.count < 6 {
        return UIColor.clear
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if cString.hasPrefix("0X") {
        cString = cString.subString(start: 2);
        print("cString:",cString);
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if cString.hasPrefix("#") {
        cString = cString.subString(start: 1)
    }
    if cString.count != 6 {
        return UIColor.clear
    }
    // Separate into r, g, b substrings
    
    //r
    let rString : String!
    rString = cString.subString(start: 0,length: 2)
    //g
    let gString : String!
    gString = cString.subString(start: 2,length: 2)
    //b
    let bString : String!
    bString = cString.subString(start: 4,length: 2)

    // Scan values
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha!)
    return color;
    }

    
    
    
    
    
}


