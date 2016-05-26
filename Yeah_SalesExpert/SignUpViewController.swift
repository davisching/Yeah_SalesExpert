//
//  SignUpViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/4.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBAction func bt_tap(sender: AnyObject) {
        tf_userName.resignFirstResponder()
        tf_pass01.resignFirstResponder()
        tf_pass02.resignFirstResponder()
        tf_name.resignFirstResponder()
        tf_code.resignFirstResponder()
        tf_comName.resignFirstResponder()
    }
    
    @IBAction func bt_add(sender: AnyObject) {
        let userName : String = tf_userName.text!
        let password1 : String = tf_pass01.text!
        let password2 : String = tf_pass02.text!
        let name : String = tf_name.text!
        let code : String = tf_code.text!
        let comName : String = tf_comName.text!
        if DataReader.checkIsExist(userName) {
            let alert = UIAlertView.init(title: "用户名已存在", message: "很抱歉，请使用其他用户名!", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        } else {
            if userName == "" || password1 == "" || password2 == "" || name == "" || code == "" && comName == "" {
                let alert = UIAlertView.init(title: "输入不能为空", message: "请填写需要的数据!", delegate: nil, cancelButtonTitle: "返回")
                alert.show()
            } else {
                if password1 != password2 {
                    let alert = UIAlertView.init(title: "两次密码不匹配", message: "请修改密码，两次密码需要相同!", delegate: nil, cancelButtonTitle: "返回")
                    alert.show()
                } else {
                    let user = UserInfo.init(_userName: userName, _password : password1)
                    user.setName(name)
                    
                    if code != "" {
                        if DataReader.isCodeExist(code) {
                            let com = DataReader.getComByCode(code)
                            user.setComId(com.getId())
                            DataReader.appendUserList(user)
                            
                            let alert = UIAlertView.init(title: "注册成功", message: "感谢使用本软件!", delegate: nil, cancelButtonTitle: "返回")
                            alert.show()
                            
                            self.navigationController?.popViewControllerAnimated(true)
                        } else {
                            let alert = UIAlertView.init(title: "邀请码不存在", message: "请修改公司的邀请码!", delegate: nil, cancelButtonTitle: "返回")
                            alert.show()
                        }
                    } else {
                        let com = CompanyInfo.init(_name : comName)
                        com.appendUserList(user.getId())
                        DataReader.appendComList(com, _user: user)
                        
                        let alert = UIAlertView.init(title: "注册成功", message: "感谢使用本软件!", delegate: nil, cancelButtonTitle: "返回")
                        alert.show()
                        
                        self.navigationController?.popViewControllerAnimated(true)
                    }
                    
                }
            }
        }
    }
    
    @IBOutlet weak var tf_userName: UITextField!
    @IBOutlet weak var tf_pass01: UITextField!
    @IBOutlet weak var tf_pass02: UITextField!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_code: UITextField!
    @IBOutlet weak var tf_comName: UITextField!
    @IBOutlet weak var scorllView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scorllView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height + 1)
        transAll()
        self.navigationController?.navigationBarHidden = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tf_userName.text = ""
        tf_pass01.text = ""
        tf_pass02.text = ""
        tf_name.text = ""
        tf_code.text = ""
        tf_comName.text = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func transAll(){
        trans(scorllView)
    }
    
    
    //Turn one view and all its subviews into suitable size
    private func trans(temp : UIView){
        temp.frame = remakeFrame(temp.frame.origin.x, y: temp.frame.origin.y, width: temp.frame.size.width, height: temp.frame.size.height)
        
        if(temp.subviews.count != 0){
            for i in temp.subviews{
                trans(i)
            }
        }
    }
    
    let transX = UIScreen.mainScreen().bounds.size.width / 375
    let transY = UIScreen.mainScreen().bounds.size.height / 667
    
    
    //Turn one view into suitable size
    private func remakeFrame(x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat) -> CGRect{
        var rect = CGRect.init()
        if(rect.origin.x < 0){
            
        }else{
            rect.origin.x = x * transX
        }
        
        rect.origin.y = y * transY
        rect.size.width = width * transX
        rect.size.height = height * transY
        return rect
    }
    


}
