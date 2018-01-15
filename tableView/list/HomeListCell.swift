//
//  HomeListCell.swift
//  tableView
//
//  Created by 段桥 on 2018/1/11.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit

class HomeListCell: UITableViewCell {

    public var titleLabel:UILabel! //标题
    public var paper:UILabel!      //摘要
    public var timeLabel:UILabel!  //时间
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        
        makeTitleLabel()
        makePaper()
        makeTimeLabel()
    }

    func makeTitleLabel(){
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = Helper().colorValue("#333333", alpha: 1.0)
        self.contentView.addSubview(titleLabel);
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15);
            make.left.equalTo(15);
            make.height.equalTo(28);
            make.width.equalTo(kScreeWidth/3*2);
        }
    }
    
    func makePaper() {
        paper = UILabel()
        paper.font = UIFont.systemFont(ofSize: 16)
        paper.textColor = Helper().colorValue("#474747", alpha: 1.0)
        self.contentView.addSubview(paper);
        paper.snp.makeConstraints { (make) in
            make.left.equalTo(15);
            make.right.equalTo(-18.5);
            make.top.equalTo(titleLabel.snp.bottom).offset(10);
            make.height.equalTo(22.5);
        }
    }
    
    func makeTimeLabel() {
        timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = Helper().colorValue("#999999", alpha: 1.0)
        self.contentView.addSubview(timeLabel);
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(paper.snp.bottom).offset(5);
            make.right.equalTo(-15);
            make.left.equalTo(15);
        }
    }

    
//    lazy var myLabel: UILabel = {
//        timeLabel = UILabel()
//        timeLabel.font = UIFont.systemFont(ofSize: 12)
//        timeLabel.textColor = Helper().colorValue("#999999", alpha: 1.0)
//        self.contentView.addSubview(timeLabel);
//        timeLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(paper.snp.bottom).offset(5);
//            make.right.equalTo(-15);
//            make.left.equalTo(15);
//        }
//        return timeLabel
//    }()
}
