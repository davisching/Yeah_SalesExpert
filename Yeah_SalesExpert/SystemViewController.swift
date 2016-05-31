//
//  SystemViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/28.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class SystemViewController: UIViewController {

    @IBOutlet weak var tf_oldPassword: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_password2: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func bt_pass(sender: AnyObject) {
        
        if !DataReader.checkPassword(DataReader.getCurrentUser().getUserName(), password: tf_oldPassword.text!) {
            
            //If the old password that user enter does not match the correct one
            let alert = UIAlertView.init(title: "旧密码错误", message: "请填写正确的旧密码!", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
            
            } else {
                if tf_password.text == "" || tf_password2.text == "" {
                    
                    //If either the textFields of both new password is empty
                    let alert = UIAlertView.init(title: "输入不能为空", message: "请填写需要的数据!", delegate: nil, cancelButtonTitle: "返回")
                    alert.show()
                    
                    } else {
                    
                        //If both two textFields of new passwords do not match each other
                        if tf_password.text != tf_password2.text {
                            let alert = UIAlertView.init(title: "两次密码不匹配", message: "请修改密码，两次密码需要相同!", delegate: nil, cancelButtonTitle: "返回")
                            alert.show()
                            
                        } else {
                            
                            //Otherwise
                            let user = DataReader.getCurrentUser()
                            user.setPassword(tf_password.text!)
                            DataReader.modifyUser(user)
                            
                            let alert = UIAlertView.init(title: "密码修改成功", message: "该用户的密码已经被正确地修改!", delegate: nil, cancelButtonTitle: "返回")
                            alert.show()
                            
                            tf_password.text = ""
                            tf_password2.text = ""
                            tf_oldPassword.text = ""
                        }
                    }
            }
    }
    

    @IBAction func bt_quit(sender: AnyObject) {
        let loginStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let loginView = loginStoryBoard.instantiateViewControllerWithIdentifier("LoginViewController")
        self.navigationController?.pushViewController(loginView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height * DataReader.getAwayNaviBarDIVIDEscreen(UIScreen.mainScreen().bounds.size.width))
        transAll()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
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
        trans(scrollView)
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
