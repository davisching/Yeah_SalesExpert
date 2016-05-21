//
//  NewFollowViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/21.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class NewFollowViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tf: UITextView!
    @IBAction func bt_Add(sender: AnyObject) {
        if tf.text == "" {
        
        } else {
            let today:NSDate = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = Int(dateFormatter.stringFromDate(today))
            dateFormatter.dateFormat = "MM"
            let month = Int(dateFormatter.stringFromDate(today))
            dateFormatter.dateFormat = "dd"
            let day = Int(dateFormatter.stringFromDate(today))
            
            print(year)
             print(month)
             print(day)
            
            DataReader.getCurrentOppo().appendList(Check.init(YY: year!, MM: month!, DD: day!, _context: tf.text))
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新增跟进纪录"
        transAll()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height * DataReader.getAwayNaviBarDIVIDEscreen(UIScreen.mainScreen().bounds.size.width))
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
