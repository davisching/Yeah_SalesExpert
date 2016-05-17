//
//  OtherViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/17.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    @IBOutlet weak var bacImage: UIImageView!
    @IBOutlet weak var bt_myCompany: UIButton!
    @IBOutlet weak var bt_contact: UIButton!
    @IBOutlet weak var bt_contracts: UIButton!
    @IBOutlet weak var bt_visiting: UIButton!
    @IBOutlet weak var bt_sales: UIButton!
    @IBOutlet weak var bt_system: UIButton!
    
    @IBAction func bt_contact(sender: AnyObject) {
        let contactInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        
        self.navigationController?.navigationBarHidden = false
        
        let contactaddView = contactInfoStoryBoard.instantiateViewControllerWithIdentifier("ContactTableViewController")
        self.navigationController?.pushViewController(contactaddView, animated: true)
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
        self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = false
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
        trans(bacImage)
        trans(bt_myCompany)
        trans(bt_contact)
        trans(bt_contracts)
        trans(bt_visiting)
        trans(bt_sales)
        trans(bt_system)
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
