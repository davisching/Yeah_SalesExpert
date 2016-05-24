//
//  NewViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var img_back: UIImageView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var bt_newContact: UIButton!
    @IBOutlet weak var bt_newClient: UIButton!
    @IBOutlet weak var bt_newContract: UIButton!
    @IBOutlet weak var bt_newOppotunity: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func bt_newContract(sender: AnyObject) {
        
    }
    
    @IBAction func bt_newOppotunity(sender: AnyObject) {
        let clientInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        
        self.navigationController?.navigationBarHidden = false
        
        let clientaddView = clientInfoStoryBoard.instantiateViewControllerWithIdentifier("NewOppoViewController")
        self.navigationController?.pushViewController(clientaddView, animated: true)
    }
    
    @IBAction func bt_newClient(sender: AnyObject) {
        
        let clientInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)

        self.navigationController?.navigationBarHidden = false
        
        let clientaddView = clientInfoStoryBoard.instantiateViewControllerWithIdentifier("NewClientViewController")
        self.navigationController?.pushViewController(clientaddView, animated: true)
    }
    
    @IBAction func bt_newContact(sender: AnyObject) {
        let clientInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        
        self.navigationController?.navigationBarHidden = false
        
        let clientaddView = clientInfoStoryBoard.instantiateViewControllerWithIdentifier("NewContactViewController")
        self.navigationController?.pushViewController(clientaddView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height + 1)
        transAll()
        // Do any additional setup after loading the view.
        MyCloud.initConnection()
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = false
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
    
    private func transAll(){
        trans(img_back)
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
