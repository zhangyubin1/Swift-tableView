//
//  LgoinController.swift
//  tableView
//
//  Created by 段桥 on 2018/1/12.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit

 class LoginController: UIViewController,UIScrollViewDelegate,UITextFieldDelegate {
    
    // MARK: - property
    private var scrollContainer:UIScrollView!//界面容器
    
    private var phonePage:UIView!            //手机号输入界面
    private var logoImageView:UIImageView!   //logo
    private var subtitleLabel:UILabel!       //副标题(高效准确的录音转文本工具)
    private var phoneTextFiled:UITextFieldClearButton!  //手机号输入
    private var grayView:UIView!             //手机号输框分割线
    private var errMsgLabel:UILabel!            //手机号错误提示
    private var stepButton:UIButton!         //下一步按钮
    
    private var codePage:UIView!             //验证码输入界面
    private var backButton:UIButton!         //返回按钮
    private var titleLabel:UILabel!          //输入验证码title
    private var codeSubtitleLabel:UILabel!   //显示手机号
    private var iputCodeView:InputCodeView!  //输入验证码
    private var getCodeButton:UIButton!      //获取验证码

    
    // MARK: - lifecycle
    override  func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    //创建UI界面
    func setupUI(){
        view.backgroundColor = UIColor.white
        makeContainer()
       
        //手机号输入页
        makePhonePage()
        makeLogoImageView()
        makeSubtitleLabel()
        makePhoneTextFiled()
        makeGaryView()
        makeErrLabel()
        makeStepButton()
        
        //验证码
        
        
        //新手登录成功
        
        
        //注册通知
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textFieldDidChange(notification:)),
                                               name: NSNotification.Name.UITextFieldTextDidChange, object: nil)

    }
    
 
    //MARK: UITextFieldTextDidChangeNotification
    @objc func textFieldDidChange(notification: NSNotification){
        let textF:UITextField = notification.object as! UITextField
        if textF.isEqual(phoneTextFiled) {// 手机号输入
            phoneTextFiledDidChange()
        }else{ //验证码输入
            
        }
    }
    
    func phoneTextFiledDidChange(){
        // textfiled 内无任何输入
        if phoneTextFiled.text?.count == 0 {
            errMsgLabel.isHidden = true
            grayView.backgroundColor = Helper().colorValue("#DDDDDD", alpha: 1.0)
            stepButton.isEnabled = false
        }else{
            //手机号开头数字不是 1
            if !(phoneTextFiled.text?.hasPrefix("1"))!{
                errMsgLabel.isHidden = false
                grayView.backgroundColor = Helper().colorValue("#FE4246", alpha: 1.0)
                stepButton.isEnabled = false
                
            }else{
                errMsgLabel.isHidden = true
                grayView.backgroundColor = Helper().colorValue("#333333", alpha: 1.0)
                if phoneTextFiled.text?.count == 11{
                    stepButton.isEnabled = true
                }
            }
        }
    }
    
    //MARK:UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == phoneTextFiled) {
            if (string.count == 0){
                return true;
            }
            let existedLength = textField.text?.count;
            let selectedLength = range.length;
            let replaceLength = string.count;
            if (existedLength! - selectedLength + replaceLength > 11){
                return false;
            }
        }

        return true
    }
  
    // MARK: - lazy
    func makeContainer()  {
        scrollContainer = UIScrollView()
        scrollContainer.contentSize = CGSize.init(width: kScreeWidth*3, height: kScreenHeight)
        scrollContainer.delegate = self
        scrollContainer.isPagingEnabled = true
        view.addSubview(scrollContainer)
        scrollContainer.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    func makePhonePage(){
        phonePage = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreeWidth, height: kScreenHeight))
        scrollContainer.addSubview(phonePage)
        
    }
    
    func makeLogoImageView(){
        logoImageView = UIImageView()
        logoImageView.image = UIImage.init(named: "loginlogo")
        logoImageView.contentMode = UIViewContentMode.center
        phonePage.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(71.35);
            make.left.equalTo(25);
            make.width.equalTo(30.7+8.1+64.85);
            make.height.equalTo(35.55);
        }
    }
    
    func makeSubtitleLabel(){
        subtitleLabel = UILabel()
        subtitleLabel.text = "高效准确的录音转文本工具"
        subtitleLabel.font = UIFont.systemFont(ofSize: 18)
        subtitleLabel.textColor = Helper().colorValue("#333333", alpha: 1.0)
        phonePage.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(27.1);
            make.left.equalTo(25);
            make.width.equalTo(230);
            make.height.equalTo(18);
        }
    }
    
    func makePhoneTextFiled(){
        phoneTextFiled = UITextFieldClearButton()
        phoneTextFiled.delegate = self
        phoneTextFiled.tintColor = UIColor.init(red: 251/255.0, green: 68/255.0, blue: 76/255.0, alpha: 1.0)
        phoneTextFiled.font = UIFont.systemFont(ofSize: 16)
        phoneTextFiled.placeholder = "请输入手机号"
        phoneTextFiled.keyboardType = UIKeyboardType.numberPad
        phoneTextFiled.borderStyle = UITextBorderStyle.none
        phoneTextFiled.clearButtonMode = UITextFieldViewMode.whileEditing
        let button:UIButton = phoneTextFiled.value(forKey: "_clearButton") as! UIButton
        button.setImage(UIImage.init(named: "delete-1"), for: UIControlState.normal)
        phoneTextFiled.textColor = Helper().colorValue("#333333", alpha: 1.0)
        phoneTextFiled.setValue(Helper().colorValue("#999999", alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        phoneTextFiled.setValue(UIFont.systemFont(ofSize: 16), forKeyPath: "_placeholderLabel.font")
        phonePage.addSubview(phoneTextFiled)
        phoneTextFiled.snp.makeConstraints { (make) in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(55);
            make.left.equalTo(25);
            make.right.equalTo(-25);
            make.height.equalTo(22.5);
        }
    }
    
    func makeGaryView(){
        grayView = UIView()
        grayView.backgroundColor = Helper().colorValue("#DDDDDD", alpha: 1.0)
        phonePage.addSubview(grayView)
        grayView.snp.makeConstraints { (make) in
            make.top.equalTo(phoneTextFiled.snp.bottom).offset(10);
            make.left.equalTo(25);
            make.right.equalTo(-25);
            make.height.equalTo(0.5);
        }
    }
    
    func makeErrLabel(){
        errMsgLabel = UILabel()
        errMsgLabel.text = "手机号格式有误"
        errMsgLabel.isHidden = true
        errMsgLabel.font = UIFont.systemFont(ofSize: 12)
        errMsgLabel.textColor = Helper().colorValue("#FE4246", alpha: 1.0)
        view.addSubview(errMsgLabel)
        errMsgLabel.snp.makeConstraints { (make) in
            make.top.equalTo(grayView.snp.bottom).offset(5.5);
            make.left.equalTo(grayView.snp.left);
            make.width.equalTo(100);
            make.height.equalTo(12);
        }
    }
    
    func makeStepButton(){
        stepButton = UIButton()
        stepButton.isEnabled = false
        stepButton.setImage(UIImage.init(named: "in"), for: UIControlState.normal)
        stepButton.setImage(UIImage.init(named: "unable"), for: UIControlState.disabled)
        stepButton.setImage(UIImage.init(named: "in2"), for: UIControlState.highlighted)
        stepButton.layer.cornerRadius = 4.0
        phonePage.addSubview(stepButton)
        stepButton.snp.makeConstraints { (make) in
            make.top.equalTo(grayView.snp.bottom).offset(40);
            make.left.right.equalTo(grayView);
            make.height.equalTo(40);
        }
    }
    
}
