//
//  TargetViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/29.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {

    @IBOutlet weak var lb_target: UILabel!
    @IBOutlet weak var lb_win: UILabel!
    @IBOutlet weak var lb_percent: UILabel!
    @IBOutlet weak var lb_box: UILabel!
    @IBOutlet weak var tf_target: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func bt_tap(sender: AnyObject) {
        tf_target.resignFirstResponder()
    }
    @IBAction func bt_change(sender: AnyObject) {
        if tf_target.text != "" {
            DataReader.getCurrentUser().setTargetSales(Int(tf_target.text!)!)
            
            DataReader.modifyUser(DataReader.getCurrentUser())
            
            let storyBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let refreshView = storyBoard.instantiateViewControllerWithIdentifier("RefreshViewController")
            self.navigationController?.pushViewController(refreshView, animated: false)
            
            let alert = UIAlertView.init(title: "修改成功", message: "该用户的销售目标已经更改！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transAll()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height + 1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.tabBarController?.tabBar.hidden = true
        refreshData()
    }
    
    func refreshData() {
        let oppoList = DataReader.getOppoListForCurrentUser()
        var mount = 0
        for _oppo : OppoInfo in oppoList {
            if _oppo.getStage() == 4 {
                mount += _oppo.getTargetSales()
            }
        }
        
        var targetSales = Double(DataReader.getCurrentUser().getTargetSales())
        let winSales = Double(mount)
        
        if targetSales == 0 {
            targetSales = 1
        }
        
        var p = winSales / targetSales
        let percent = String(Int(p * 100)) + "%"
        
        lb_win.text = String(mount) + "元"
        lb_target.text = String(DataReader.getCurrentUser().getTargetSales()) + "元"
        lb_percent.text = percent
        
        if p > 1 {
            p = 1
        }
        
        let _height = 119 * p
        let _y = 119 * (1 - p)
        lb_box.frame = CGRect.init(x: 46.5 * Double(transX), y: (198 + _y) * Double(transY), width: 123 * Double(transX), height: _height * Double(transY))
        
        tf_target.text = String(Int(targetSales))
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
