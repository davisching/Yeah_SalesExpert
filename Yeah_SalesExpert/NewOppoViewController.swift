//
//  NewOppoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/19.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class NewOppoViewController: UIViewController {

    @IBOutlet weak var bt_tap: UIButton!
    @IBOutlet weak var lb_name: UILabel!
    @IBOutlet weak var lb_client: UILabel!
    @IBOutlet weak var lb_stage: UILabel!
    @IBOutlet weak var lb_target: UILabel!
    @IBOutlet weak var lb_product: UILabel!
    @IBOutlet weak var lb_yuan: UILabel!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_client: UITextField!
    @IBOutlet weak var tf_stage: UITextField!
    @IBOutlet weak var tf_target: UITextField!
    @IBOutlet weak var tf_product: UITextField!
    @IBOutlet weak var bt_client: UIButton!
    @IBOutlet weak var bt_stage: UIButton!
    @IBOutlet weak var bt_product: UIButton!
    @IBOutlet weak var bt_add: UIButton!
    
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
            addOppo()
        }
    }
    
    func addOppo() {
        newOppo.setName(tf_name.text!)
        newOppo.setTargetSales(Int(tf_target.text!)!)
        DataReader.appendOppoList(newOppo)
        
        self.navigationController?.popViewControllerAnimated(true)
        
        let alert = UIAlertView.init(title: "添加成功", message: "此销售机会已经被成功的添加！", delegate: nil, cancelButtonTitle: "我知道了!")
        alert.show()
        
    }
    
    private var newOppo = OppoInfo.init()
    
    func setClient(_client: ClientInfo) {
        if _client.getCompany() != "" {
            tf_client.text = _client.getName() + " (来自 " + _client.getCompany() + ")"
        } else {
            tf_client.text = _client.getName()
        }
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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        trans(bt_tap)
        trans(lb_name)
        trans(lb_client)
        trans(lb_stage)
        trans(lb_target)
        trans(lb_product)
        trans(lb_yuan)
        trans(tf_name)
        trans(tf_client)
        trans(tf_stage)
        trans(tf_target)
        trans(tf_product)
        trans(bt_client)
        trans(bt_stage)
        trans(bt_product)
        trans(bt_add)
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
