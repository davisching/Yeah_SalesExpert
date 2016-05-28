//
//  MoniterViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/28.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class MoniterViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lb_count_0: UILabel!
    @IBOutlet weak var lb_mount_0: UILabel!
    @IBOutlet weak var lb_count_1: UILabel!
    @IBOutlet weak var lb_mount_1: UILabel!
    @IBOutlet weak var lb_count_2: UILabel!
    @IBOutlet weak var lb_mount_2: UILabel!
    @IBOutlet weak var lb_count_3: UILabel!
    @IBOutlet weak var lb_mount_3: UILabel!
    @IBOutlet weak var lb_count_4: UILabel!
    @IBOutlet weak var lb_mount_4: UILabel!
    @IBOutlet weak var lb_count_sum: UILabel!
    @IBOutlet weak var lb_mount_sum: UILabel!
    
    @IBOutlet weak var lb_target: UILabel!
    @IBOutlet weak var lb_win: UILabel!
    @IBOutlet weak var lb_percent: UILabel!
    @IBOutlet weak var lb_box: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height + 1)
        transAll()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationBarHidden = false
        refreshData()
    }
    
    func refreshData() {
        var mount = [Int]()
        var count = [Int]()
        
        for _ in 0 ..< 6 {
            mount.append(0)
            count.append(0)
        }
        
        let oppoList = DataReader.getOppoListForCurrentUser()
        for _oppo : OppoInfo in oppoList {
            count[_oppo.getStage()] += 1
            mount[_oppo.getStage()] += _oppo.getTargetSales()
        }
        
        for i in 0 ..< 5 {
            mount[5] += mount[i]
            count[5] += count[i]
        }
        
        lb_count_0.text = String(count[0])
        lb_count_1.text = String(count[1])
        lb_count_2.text = String(count[2])
        lb_count_3.text = String(count[3])
        lb_count_4.text = String(count[4])
        lb_count_sum.text = String(count[5])
        
        lb_mount_0.text = String(mount[0]) + "元"
        lb_mount_1.text = String(mount[1]) + "元"
        lb_mount_2.text = String(mount[2]) + "元"
        lb_mount_3.text = String(mount[3]) + "元"
        lb_mount_4.text = String(mount[4]) + "元"
        lb_mount_sum.text = String(mount[5]) + "元"
        
        let targetSales = Double(DataReader.getTargetSales())
        let winSales = Double(mount[4])
        let p = winSales / targetSales
        let percent = String(Int(p * 100)) + "%"
        
        lb_win.text = String(mount[4]) + "元"
        lb_target.text = String(DataReader.getTargetSales()) + "元"
        lb_percent.text = percent
        
        let _height = 119 * p
        let _y = 119 * (1 - p)
        lb_box.frame = CGRect.init(x: 57, y: 511 + _y - 18, width: 123, height: _height)
        
        /*
         57.0
         511.0
         123.0
         101.0
         */
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
