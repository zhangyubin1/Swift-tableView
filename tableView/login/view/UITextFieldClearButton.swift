//
//  UITextFieldClearButton.swift
//  tableView
//
//  Created by 段桥 on 2018/1/15.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit

class UITextFieldClearButton: UITextField {

    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        
        var rect:CGRect!
        rect = CGRect.init(x: bounds.size.width-15, y: (bounds.size.height-15)/2, width: 15, height: 15)
        return rect
        
    }
    
}
