//
//  ContactInfoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/18.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    var contactInfo = ContactInfo.init()

    @IBOutlet weak var bt_tap: UIButton!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var lb_mobile: UILabel!
    @IBOutlet weak var lb_phone: UILabel!
    @IBOutlet weak var tf_mobile: UITextField!
    @IBOutlet weak var tf_phone: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var lb_line: UILabel!

    
    @IBAction func bt_tap(sender: AnyObject) {
        tf_name.resignFirstResponder()
        tf_mobile.resignFirstResponder()
        tf_phone.resignFirstResponder()
        tf_email.resignFirstResponder()
    }

    @IBAction func bt_modify(sender: AnyObject) {
        if tf_name.text == "" {
            let alert = UIAlertView.init(title: "Need a name", message: "Please give your contact a name!", delegate: nil, cancelButtonTitle: "Return")
            alert.show()
        } else {
            modifyAContact()
        }
    }
    
    func modifyAContact(){
        let index = DataReader.getCurrentContactIndex()
        let newContact = ContactInfo.init()
        newContact.setName(tf_name.text!)
        newContact.setMobile(tf_mobile.text!)
        newContact.setPhone(tf_phone.text!)
        newContact.setEmail(tf_email.text!)
        newContact.setId(contactInfo.getId())
        newContact.setClientId(contactInfo.getClientId())
        DataReader.modifyContactInIndex(newContact, _contactIndex: index)
        
        let alert = UIAlertView.init(title: "Success", message: "The information of this contact has been modified successfully!", delegate: nil, cancelButtonTitle: "Great!")
        alert.show()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transAll()
        contactInfo = DataReader.getCurrentContact()
        self.title = contactInfo.getName()
        tf_name.text = contactInfo.getName()
        tf_mobile.text = contactInfo.getMobile()
        tf_phone.text = contactInfo.getPhone()
        tf_email.text = contactInfo.getEmail()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
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
        trans(lb_name)
        trans(tf_name)
        trans(bt_tap)
        trans(lb_mobile)
        trans(lb_phone)
        trans(lb_email)
        trans(tf_mobile)
        trans(tf_phone)
        trans(tf_email)
        trans(lb_line)
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
