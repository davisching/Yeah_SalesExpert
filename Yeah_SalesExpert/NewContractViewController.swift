//
//  NewContractViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/31.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class NewContractViewController: UIViewController {

    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_stage: UITextField!
    @IBOutlet weak var tf_oppo: UITextField!
    @IBOutlet weak var tf_way: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func bt_add(sender: AnyObject) {
        if tf_name.text == "" || tf_oppo == "" {
            let alert = UIAlertView.init(title: "无法添加", message: "请填写完整该合同所需要的信息!", delegate: nil, cancelButtonTitle: "好的!")
            alert.show()
        } else {
            
            let contract = ContractInfo.init(_name: tf_name.text!)
            contract.setUserId(DataReader.getCurrentUser().getId())
            contract.setComId(DataReader.getCurrentCom().getId())
            contract.setOppoId(oppo.getId())
            contract.setContractStage(stageIndex)
            contract.setPayWay(wayIndex)
            
            if textView.text == "" {
                contract.setNote(" ")
            } else {
                contract.setNote(textView.text)
            }
            
            let today:NSDate = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "YYYY"
            let year = Int(dateFormatter.stringFromDate(today))
            dateFormatter.dateFormat = "MM"
            let month = Int(dateFormatter.stringFromDate(today))
            dateFormatter.dateFormat = "dd"
            let day = Int(dateFormatter.stringFromDate(today))
            
            contract.setDate(year!, _month: month!, _day: day!)

            DataReader.appendContractList(contract)
            
            let alert = UIAlertView.init(title: "添加成功", message: "该合同已经被成功地添加了!", delegate: nil, cancelButtonTitle: "我知道了!")
            alert.show()
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func bt_tap(sender: AnyObject) {
        tf_name.resignFirstResponder()
        textView.resignFirstResponder()
    }
    
    @IBAction func bt_changeStageLeft(sender: AnyObject) {
        stageIndex -= 1
        if stageIndex == -1 {
            stageIndex = 3
        }
        tf_stage.text = ContractStage.getContractStageString(stageIndex)
    }
    
    @IBAction func bt_changeStageRight(sender: AnyObject) {
        stageIndex += 1
        if stageIndex == 4 {
            stageIndex = 0
        }
        tf_stage.text = ContractStage.getContractStageString(stageIndex)
    }
    
    @IBAction func bt_changeWayLeft(sender: AnyObject) {
        wayIndex -= 1
        if wayIndex == -1 {
            wayIndex = 3
        }
        tf_way.text = PayWay.getPayWayString(wayIndex)
    }
    
    @IBAction func bt_changeWayRight(sender: AnyObject) {
        wayIndex += 1
        if wayIndex == 4 {
            wayIndex = 0
        }
        tf_way.text = PayWay.getPayWayString(wayIndex)
    }
        
    var stageIndex = 0, wayIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height * DataReader.getAwayNaviBarDIVIDEscreen(UIScreen.mainScreen().bounds.size.width))
        transAll()
        
        tf_stage.text = ContractStage.getContractStageString(stageIndex)
        tf_way.text = PayWay.getPayWayString(wayIndex)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var oppo = OppoInfo.init()
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        
        if DataReader.haveSelectedOppo == true {
            DataReader.haveSelectedOppo = false
            oppo = DataReader.getSelectedOppo()
            tf_oppo.text = oppo.getName()
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
