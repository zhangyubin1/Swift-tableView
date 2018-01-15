//
//  String+Category.swift
//  tableView
//
//  Created by 段桥 on 2018/1/11.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import Foundation

extension String {
    //根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}

