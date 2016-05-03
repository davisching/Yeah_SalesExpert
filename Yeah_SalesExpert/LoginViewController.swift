//
//  LoginViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/3.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , JSAnimatedImagesViewDataSource{

    @IBOutlet weak var lb_bacColor: UILabel!
    @IBOutlet weak var image_bac: UIImageView!
    @IBOutlet var allView: UIView!
    @IBOutlet weak var tf_userName: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lb_username: UITextField!
    @IBOutlet weak var lb_password: UITextField!
    @IBOutlet weak var bt_signUp: UIButton!
    @IBOutlet weak var bt_login: UIButton!
    
    @IBAction func tf_password_action(sender: AnyObject) {
        login()
         tf_password.resignFirstResponder()
    }
    @IBAction func bt_signUp(sender: AnyObject) {
        signUp()
    }
    
    @IBAction func bt_login(sender: AnyObject) {
        login()
    }
    
    func login() {
        let userName = tf_userName.text
        let password = tf_password.text
        print("userName : \(userName), password : \(password)")
    }
    
    func signUp() {
        print("sign up")
    }
    
    @IBAction func bt_tap(sender: AnyObject) {
        tf_userName.resignFirstResponder()
        tf_password.resignFirstResponder()
    }
    
    @IBOutlet weak var wallPaper: JSAnimatedImagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        wallPaper.dataSource = self
        
        transAll()
        
    }
    
    private func transAll(){
        trans(lb_bacColor)
        trans(image_bac)
        trans(button)
        trans(lb_username)
        trans(tf_userName)
        trans(lb_password)
        trans(tf_password)
        trans(bt_signUp)
        trans(bt_login)
    }
    
    private func trans(temp : UIView){
        temp.frame = remakeFrame(temp.frame.origin.x, y: temp.frame.origin.y, width: temp.frame.size.width, height: temp.frame.size.height)
        
        if(temp.subviews.count != 0){
            for i in temp.subviews{
                trans(i)
            }
        }
    }
    
    
    /*
     iphone 5 : 320 : 568
     iphone 6 : 375 : 667
     iphone 6 plus : 414 : 736
     */
    
    let transX = UIScreen.mainScreen().bounds.size.width / 375
    let transY = UIScreen.mainScreen().bounds.size.height / 667
    
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
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 6
    }
    
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage.init(named: "indexBac\(index)")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
