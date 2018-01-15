//
//  WebController.swift
//  tableView
//
//  Created by 段桥 on 2018/1/3.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController {
    
    var back : UIView!
    var webView: WKWebView!
    var urlString :String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        makeBack()
        makeWebView()
        let urlCode = URL(string: urlString)
        let request:URLRequest = URLRequest(url:urlCode!)
        webView.load(request)

    }

    
    func makeBack() {
        back = UIView()
        back.backgroundColor = UIColor.blue
        view.addSubview(back);
        back.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(64)
    
        }
        
        let tap = UITapGestureRecognizer()
        back.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(tapPoint(_:)))
        
    }
    
    @objc func tapPoint(_ tapGes:UITapGestureRecognizer){
        
        self.dismiss(animated: true) {
            
        }
    }
    
    func makeWebView(){
        let config:WKWebViewConfiguration = WKWebViewConfiguration();
        webView = WKWebView(frame: view.bounds, configuration: config)
        view.addSubview(webView);
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    
}
