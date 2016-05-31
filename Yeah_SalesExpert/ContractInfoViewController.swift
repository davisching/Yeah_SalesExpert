//
//  ContractInfoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/31.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class ContractInfoViewController: UIViewController {

    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_oppo: UITextField!
    @IBOutlet weak var tf_stage: UITextField!
    @IBOutlet weak var tf_way: UITextField!
    @IBOutlet weak var tf_money: UITextField!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var tf_client: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func bt_modify(sender: AnyObject) {
        
    }
    
    @IBAction func bt_del(sender: AnyObject) {
        
    }
    
    @IBAction func bt_oppo(sender: AnyObject) {
        DataReader.setCurrentOppo(oppo)
        let storyBoard = UIStoryboard.init(name: "Index", bundle: nil)
        let oppoView = storyBoard.instantiateViewControllerWithIdentifier("OppoInfoViewController")
        self.navigationController?.pushViewController(oppoView, animated: true)
    }
    
    @IBAction func bt_client(sender: AnyObject) {
        if isDeleted == true {
            let alert = UIAlertView.init(title: "无法查看", message: "该客户已经被删除！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        } else {
            DataReader.setCurrentClient(client)
            let clientInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let clientaddView = clientInfoStoryBoard.instantiateViewControllerWithIdentifier("ClientInfoViewController")
            self.navigationController?.pushViewController(clientaddView, animated: true)
        }
    }
    
    var oppo = OppoInfo.init()
    var client = ClientInfo.init()
    var isDeleted = false
    
    func refresh() {
        let contract = DataReader.getCurrentContract()
        tf_name.text = contract.getName()
        oppo = DataReader.getOppotunityWithId(contract.getOppoId())
        tf_oppo.text = oppo.getName()
        tf_stage.text = String(ContractStage.getContractStageString(contract.getContractStage()))
        tf_way.text = String(PayWay.getPayWayString(contract.getPayWay()))
        tf_money.text = String(oppo.getTargetSales())
        client = DataReader.getClientWithId(oppo.getClientId())
        
        if client.getName() == "" {
            tf_client.text = "该客户已被删除"
            isDeleted = true
        } else {
            tf_client.text = client.getName()
            isDeleted = false
        }
        textField.text = contract.getNote()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height * DataReader.getAwayNaviBarDIVIDEscreen(UIScreen.mainScreen().bounds.size.width))
        transAll()
        // Do any additional setup after loading the view.
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
