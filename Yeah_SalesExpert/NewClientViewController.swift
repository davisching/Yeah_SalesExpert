//
//  NewClientViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class NewClientViewController: UIViewController {

    
    @IBOutlet weak var bt_tap: UIButton!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var lb_company: UILabel!
    @IBOutlet weak var tf_company: UITextField!
    @IBOutlet weak var lb_job: UILabel!
    @IBOutlet weak var tf_job: UITextField!
    @IBOutlet weak var lb_mobile: UILabel!
    @IBOutlet weak var tf_mobile: UITextField!
    @IBOutlet weak var lb_phone: UILabel!
    @IBOutlet weak var tf_phone: UITextField!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var bt_add: UIButton!
    
    @IBAction func bt_tap(sender: UIButton) {
        tf_name.resignFirstResponder()
        tf_company.resignFirstResponder()
        tf_job.resignFirstResponder()
        tf_mobile.resignFirstResponder()
        tf_phone.resignFirstResponder()
        tf_email.resignFirstResponder()
    }
    
    @IBAction func bt_add(sender: AnyObject) {
        if tf_name.text == "" {
            let alert = UIAlertView.init(title: "需要名称", message: "请为此客户添加一个名称!", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        } else {
            addAClient()
        }
    }
    
    func addAClient(){
        let newClient = ClientInfo.init(_name: tf_name.text!)
        newClient.setCompany(tf_company.text!)
        newClient.setJob(tf_job.text!)
        newClient.setMobile(tf_mobile.text!)
        newClient.setPhone(tf_phone.text!)
        newClient.setEmail(tf_email.text!)
        DataReader.appendClientList(newClient)
        
        //self.navigationController?.popViewControllerAnimated(true)
        self.navigationController?.popViewControllerAnimated(true)
        
        let alert = UIAlertView.init(title: "添加成功", message: "此客户已经被添加至客户列表中!", delegate: nil, cancelButtonTitle: "我知道了!")
        alert.show()
        
        if DataReader.isCreateFromSelectClient == true {
            DataReader.setSelectClient(newClient)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transAll()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        
        if DataReader.isCreateFromSelectClient == true {
            bt_add.setTitle("使用此客户", forState: UIControlState.Normal)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Turn all UI into suitable size for each kinds of iphone
    private func transAll(){
        trans(lb_name)
        trans(lb_company)
        trans(tf_name)
        trans(tf_company)
        trans(bt_tap)
        trans(lb_job)
        trans(lb_mobile)
        trans(lb_phone)
        trans(lb_email)
        trans(tf_job)
        trans(tf_mobile)
        trans(tf_phone)
        trans(tf_email)
        trans(bt_add)
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
