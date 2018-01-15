//
//  ViewController.swift
//  tableView
//
//  Created by 段桥 on 2018/1/2.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//



import UIKit
import MJRefresh

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var navi1:UIView!
    
    var navi: HomePageNavi! //导航栏
    var tableView: UITableView! //声明变量的存在
    var recorderButton : UIButton! //录音按钮
    var backView :UIView! //table下拉看到的灰色背景
    
    
    var titleArr = [String]()    // 标题数组
    var contentArr = [String]()  // 摘要数组
    var timeArr = [String]()     // 时间数组
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeListCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeListCell
        
        cell?.titleLabel.text = "\(titleArr[indexPath[1]])\(indexPath[1])"
        cell?.paper.text = contentArr[indexPath[1]]
        cell?.timeLabel.text = timeArr[indexPath[1]]
        
        return cell!;
        
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112;
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath[1])
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var arr = [UITableViewRowAction]()
        
        let delete = UITableViewRowAction.init(style: UITableViewRowActionStyle.normal, title: "删除") { (action: UITableViewRowAction,indexPath: IndexPath) in
            
            let alert = UIAlertController.init(title: "确认删除"+"123", message: nil, preferredStyle: UIAlertControllerStyle(rawValue: 1)!)
            
            let actionTure = UIAlertAction.init(title: "确认", style: UIAlertActionStyle.cancel, handler: { (action) in
                
                self.titleArr.remove(at: indexPath[1])
                self.contentArr.remove(at: indexPath[1])
                self.timeArr.remove(at: indexPath[1])
                tableView.reloadData()
                
            })
            
            alert.addAction(actionTure)
            self.present(alert, animated: true, completion: nil)
            
        }
        arr.append(delete)
        
        
        return arr
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            backView.snp.updateConstraints({ (make) in
                make.height.equalTo(fabs(scrollView.contentOffset.y))
            })
        }
    }

    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        titleArr = ["2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记","2018-01-12 语音速记"]
        
        contentArr = ["现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~","现在是swift编写，现场教学~~~~~~~~~"]
        
        timeArr = ["下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11","下午 04:11"]
        
        makeNavi()
        makeBackView()
        makeTableView()
        makeRecorderButton()
        view.backgroundColor = UIColor.white
        tableView.backgroundColor = UIColor.clear
        makeMJRefresh()
   
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    // MARK: method
    func makeMJRefresh(){
        let headMj = MJRefreshGifHeader()
        headMj.lastUpdatedTimeLabel.isHidden = true
        headMj.stateLabel.isHidden = true;
        let idleImages =         [UIImage.init(named:"refresh_1"),UIImage.init(named:"refresh_2"),UIImage.init(named:"refresh_3")]
        let refreshingImages = [UIImage.init(named:"refreshing_1"),UIImage.init(named:"refreshing_2"),UIImage.init(named:"refreshing_3")]
        let pullingImages = [UIImage.init(named:"songkai_1"),UIImage.init(named:"songkai_2"),UIImage.init(named:"songkai_3")]
        
        headMj.setImages(idleImages, duration: 1, for:MJRefreshState.idle)
        headMj.setImages(refreshingImages, duration: 1, for:MJRefreshState.refreshing)
        headMj.setImages(pullingImages, duration: 1, for:MJRefreshState.pulling)

        headMj.setRefreshingTarget(self, refreshingAction: #selector(loadNewData))
        tableView.mj_header = headMj;
        
    }
    
    @objc func loadNewData(){
        
        tableView.mj_header.endRefreshing()
    }
    

    // MARK: -lazy
    func makeNavi(){
        navi = HomePageNavi()
        navi.backgroundColor = UIColor.white
        view.addSubview(navi)
        navi.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0);
            make.height.equalTo(64);
        }
        navi?.more .addTarget(self, action: #selector(clickMore), for: UIControlEvents.touchUpInside)
    }
    
    func makeBackView(){
        backView = UIView()
        backView.backgroundColor = Helper().colorValue("#F6F6F6", alpha: 1.0)
        view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(navi.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(0)
        }
    }
    
    @objc func clickMore(){
        
        print("1111111")
    }
    
    func makeTableView(){
        tableView = UITableView()
        tableView.delegate = self;
        tableView.dataSource = self;
        let tableFooter = UIView()
        tableView.tableFooterView = tableFooter
        tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
        tableView.register(HomeListCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView);
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(navi.snp.bottom).offset(0);
            make.bottom.equalTo(0);
            make.right.equalTo(0);
            make.left.equalTo(0);

        }
    }
    
    func makeRecorderButton(){
        recorderButton = UIButton()
        recorderButton.backgroundColor = UIColor.brown
        view.addSubview(recorderButton);
        recorderButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(-50)
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.centerX.equalTo(kScreeWidth/2)
        }
        recorderButton.addTarget(self, action:#selector(clickButton), for:.touchUpInside)
    }
    
    @objc func clickButton(_ button:UIButton){
        button.setTitle("111", for: .highlighted)
        NSLog("11111111111111111");
        let web = WebController()
        web.urlString = "http://www.baidu.com"
        self.present(web, animated: true) {
            
        }
    }
    
}

