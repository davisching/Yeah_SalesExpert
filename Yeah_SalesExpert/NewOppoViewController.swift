//
//  NewOppoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/19.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class NewOppoViewController: UIViewController {

    @IBOutlet weak var bt_add: UIButton!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_client: UITextField!
    @IBOutlet weak var tf_stage: UITextField!
    @IBOutlet weak var tf_target: UITextField!
    @IBOutlet weak var tf_product: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func bt_tap(sender: AnyObject) {
        tf_name.resignFirstResponder()
        tf_target.resignFirstResponder()
    }
    
    @IBAction func bt_client(sender: AnyObject) {
        let indexStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        let clientSelectView = indexStoryBoard.instantiateViewControllerWithIdentifier("SelectClientTableViewController")
        self.navigationController?.pushViewController(clientSelectView, animated: true)
    }
    
    @IBAction func bt_stage(sender: AnyObject) {
        DataReader.isCreatingAnOppotunity = true
        DataReader.setCurrentStage(newOppo.getStage())
        let indexStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        let stageSelectView = indexStoryBoard.instantiateViewControllerWithIdentifier("SelectStageViewController")
        self.navigationController?.pushViewController(stageSelectView, animated: true)
        
    }
    
    @IBAction func bt_product(sender: AnyObject) {
       
        DataReader.isCreatingAnOppotunity = true
        let indexStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        let productSelectView = indexStoryBoard.instantiateViewControllerWithIdentifier("ProductTableViewController")
        self.navigationController?.pushViewController(productSelectView, animated: true)
    }
    
    @IBAction func bt_add(sender: AnyObject) {
        
        if tf_name.text == "" || tf_client.text == ""  || tf_stage.text == ""  || tf_target.text == "" {
            let alert = UIAlertView.init(title: "必要信息未填写", message: "请为此销售机会填写所有必填项目!", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        } else {
            if Int(tf_target.text!)! == 0 {
                
                let alert = UIAlertView.init(title: "不能为0", message: "销售目标不能为0！", delegate: nil, cancelButtonTitle: "返回")
                alert.show()
                
            } else {
            
                if DataReader.isModifyingAnOppotunity == true {
                    newOppo.setName(tf_name.text!)
                    newOppo.setTargetSales(Int(tf_target.text!)!)
                    DataReader.modifyOppo(newOppo, _oppoIndex: DataReader.getCurrentOppoIndex())
                    
                    let alert = UIAlertView.init(title: "修改成功", message: "此销售机会已经被成功地修改！", delegate: nil, cancelButtonTitle: "我知道了!")
                    alert.show()
                    self.navigationController?.popViewControllerAnimated(true)
                
                } else {
                    addOppo()
                }
            }
        }
    }
    
    func addOppo() {
        newOppo.setName(tf_name.text!)
        newOppo.setTargetSales(Int(tf_target.text!)!)
        newOppo.giveId()
        DataReader.appendOppoList(newOppo)
        
        self.navigationController?.popViewControllerAnimated(true)
        
        let alert = UIAlertView.init(title: "添加成功", message: "此销售机会已经被成功的添加！", delegate: nil, cancelButtonTitle: "我知道了!")
        alert.show()
        
    }
    
    private var newOppo = OppoInfo.init()
    private var oppo = OppoInfo.init()
    
    func setClient(_client: ClientInfo) {
        tf_client.text = _client.getName()
        newOppo.setClientId(_client.getId())
    }
    
    func setStage(_stage : Int) {
        tf_stage.text = Stage.getContextWithPercentage(_stage)
        newOppo.setStage(_stage)
    }
    
    func setProduct(_product : ProductInfo) {
        tf_product.text = _product.getName()
        newOppo.setProductId(_product.getId())
    }
    
    func initText() {
        setClient(DataReader.getSelectedClient())
        setStage(DataReader.getSelectedStage())
        setProduct(DataReader.getSelectedProduct())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transAll()
        scrollView.contentSize = CGSize.init(width: UIScreen.mainScreen().bounds.size.width, height: scrollView.frame.height * DataReader.getAwayNaviBarDIVIDEscreen(UIScreen.mainScreen().bounds.size.width))
        
        if DataReader.isModifyingAnOppotunity == true {
            initInfo()
            title = "修改"
            bt_add.setTitle("修改销售机会", forState: UIControlState.Normal)
        }
        // Do any additional setup after loading the view.
    }
    
    private func initInfo() {
        newOppo = OppoInfo.init(_oppo: DataReader.getCurrentOppo())
        self.title = newOppo.getName()
       
        DataReader.setSelectedClient(DataReader.getClientWithId(newOppo.getClientId()))
        DataReader.setSelectedProduct(DataReader.getProductWithId(newOppo.getProductId()))
        DataReader.setSelectedStage(newOppo.getStage())
        
        tf_name.text = newOppo.getName()
        tf_target.text = String(newOppo.getTargetSales())
        
        initText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
     
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        DataReader.clearIsCreatingAnOppotunity()
        initText()
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
