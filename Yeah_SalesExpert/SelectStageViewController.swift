 //
//  SelectStageViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/19.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class SelectStageViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var bt_stage_0: UIButton!
    @IBOutlet weak var bt_stage_1: UIButton!
    @IBOutlet weak var bt_stage_2: UIButton!
    @IBOutlet weak var bt_stage_3: UIButton!
    @IBOutlet weak var bt_stage_4: UIButton!
    
    @IBAction func bt_stage_0(sender: AnyObject) {
        chooseStage(0)
    }
    
    @IBAction func bt_stage_1(sender: AnyObject) {
        chooseStage(1)
    }
    
    @IBAction func bt_stage_2(sender: AnyObject) {
        chooseStage(2)
    }
    
    @IBAction func bt_stage_3(sender: AnyObject) {
        chooseStage(3)
    }
    
    @IBAction func bt_stage_4(sender: AnyObject) {
        chooseStage(4)
    }
    
    func chooseStage(_stage : Int) {
        DataReader.setSelectedStage(_stage)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    private var currentStage = -6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transAll()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height * DataReader.getAwayNaviBarDIVIDEscreen(UIScreen.mainScreen().bounds.size.width))
        
        currentStage = DataReader.getCurrentStage()
        
        if currentStage < 0 {
            self.title = "阶段选择"
        } else {
            self.title = "当前阶段"
            highLight(currentStage)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func highLight(index : Int) {
        switch index {
        case 0:
            bt_stage_0.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        case 1:
            bt_stage_1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        case 2:
            bt_stage_2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        case 3:
            bt_stage_3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        case 4:
            bt_stage_4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        DataReader.setCurrentStage(-1)
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
