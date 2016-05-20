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
    @IBOutlet weak var wallPaper: JSAnimatedImagesView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //Happened after user clicked the "GO" button in the password's keyboard
    @IBAction func tf_password_action(sender: AnyObject) {
        login()
        tf_password.resignFirstResponder()
    }
    
    
    //Happened after user clicked the sign up button
    @IBAction func bt_signUp(sender: AnyObject) {
        signUp()
    }
    
    
    //Happened after user clicked the login button
    @IBAction func bt_login(sender: AnyObject) {
        login()
    }
    
    
    //Function for loginning process.
    func login() {
        let userName = tf_userName.text
        let password = tf_password.text
        print("userName : \(userName), password : \(password)")
        
        if loginCanProcess(userName!, password: password!) {
            
             DataReader.initDataProcess()
            
            let indexStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let indexViewController = indexStoryBoard.instantiateViewControllerWithIdentifier("IndexTabBarController")
            self.navigationController?.pushViewController(indexViewController, animated: true)
            
        } else {
        
        }
    }
    
    //Determine is the login info currect or not
    func loginCanProcess(userName : String, password : String) -> Bool {
        return true
    }
    
    
    //Function for signing up process.
    func signUp() {
        //THIS FUNCTION IS NOT USED CURRENTLY
        //RESERVE FOR OCCASION SITUATION.
    }
    
    
    //Clear the keyBroads when user do not needs them
    @IBAction func bt_tap(sender: AnyObject) {
        tf_userName.resignFirstResponder()
        tf_password.resignFirstResponder()
        
        lb_username.backgroundColor = UIColor.whiteColor()
        lb_password.backgroundColor = UIColor.whiteColor()
        
        lb_username.textColor = UIColor.blackColor()
        lb_password.textColor = UIColor.blackColor()
        
        tf_userName.textColor = UIColor.blackColor()
        tf_password.textColor = UIColor.blackColor()
    }
    
    
   // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()

        wallPaper.dataSource = self
        
        scrollView.contentSize = CGSize(width: UIScreen.mainScreen().bounds.size.width + 1, height: UIScreen.mainScreen().bounds.size.height)
        transAll()
        
        self.navigationController?.navigationBarHidden = true
        
        lb_username.textColor = UIColor.blackColor()
        lb_password.textColor = UIColor.blackColor()
    }
    
    // Do while view will appear
    override func viewWillAppear(animated: Bool) {
         self.navigationController?.navigationBarHidden = true
    }
    
    //Turn all UI into suitable size for each kinds of iphone
    private func transAll(){
        trans(lb_bacColor)
        trans(button)
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
    
    
    /*
     Conference iphone sizes
     iphone 5 : 320 : 568
     iphone 6 : 375 : 667
     iphone 6 plus : 414 : 736
     */
    
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
    
    
    //Set the counts of the images for the wall paper
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 6
    }
    
    
    //Set the images' names for the wall paper.
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage.init(named: "indexBac\(index)")
    }
    
    
    //Do while textView(Username) is editing
    @IBAction func tf_userName_editingBegin(sender: AnyObject) {
        lb_username.backgroundColor = UIColor.grayColor()
        lb_username.textColor = UIColor.whiteColor()
        lb_password.backgroundColor = UIColor.whiteColor()
        lb_password.textColor = UIColor.blackColor()
        tf_userName.textColor = UIColor.whiteColor()
        tf_password.textColor = UIColor.blackColor()
    }
    
    
    @IBAction func tf_password_editingBegin(sender: AnyObject) {
        lb_password.backgroundColor = UIColor.grayColor()
        lb_password.textColor = UIColor.whiteColor()
        lb_username.backgroundColor = UIColor.whiteColor()
        lb_username.textColor = UIColor.blackColor()
        tf_userName.textColor = UIColor.blackColor()
        tf_password.textColor = UIColor.whiteColor()
    }
    
    
    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
