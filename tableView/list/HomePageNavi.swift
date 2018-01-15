//
//  HomePageNavi.swift
//  tableView
//
//  Created by 段桥 on 2018/1/11.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit

class HomePageNavi: UIView {

    private var logo:UIImageView!
    public  var more:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLogo()
        makeMore()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLogo(){
        logo = UIImageView()
        logo?.image = UIImage.init(named: "LOGO")
        self.addSubview(logo)
        logo.snp.makeConstraints { (make) in
            make.top.equalTo(24.5);
            make.left.equalTo(15);
            make.width.equalTo(64);
            make.height.equalTo(28);
        }
    }
    
    func makeMore()  {
        more = UIButton()
        more.setBackgroundImage(UIImage.init(named: "more"), for: UIControlState.normal)
        more.setBackgroundImage(UIImage.init(named: "more"), for: UIControlState.highlighted)
        self.addSubview(more);
        more.snp.makeConstraints { (make) in
            make.top.equalTo(22.5);
            make.right.equalTo(-8);
            make.width.equalTo(32);
            make.height.equalTo(32);
        }
    }
    
}
