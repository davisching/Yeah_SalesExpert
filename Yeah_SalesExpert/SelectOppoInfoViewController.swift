//
//  SelectOppoInfoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/31.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class SelectOppoInfoViewController: UIViewController {
    
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_client: UITextField!
    @IBOutlet weak var tf_stage: UITextField!
    @IBOutlet weak var tf_target: UITextField!
    @IBOutlet weak var tf_product: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!

    let _w : CGFloat = UIScreen.mainScreen().bounds.size.width
    
    @IBAction func bt_select(sender: AnyObject) {
        DataReader.setSelectedOppo(oppo)
        DataReader.haveSelectedOppo = true
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isClientDeleted = false
        initInfo()
        
        //The following views
        creatFollowViews()
        scrollView.contentSize = CGSize.init(width: _w, height: FollowViewBuilder.currentY + 30)
        transAll()
        
    }
    
    func creatFollowViews() {
        let followViewBuilder = FollowViewBuilder.init()
        let checkList = oppo.getCheckList()
        let count = checkList.count
        for i in 0 ..< count {
            let _view = followViewBuilder.getView(checkList[count - i - 1])
            scrollView.addSubview(_view)
        }
    }
    
    private var oppo = OppoInfo.init()
    private var client = ClientInfo.init()
    private var product = ProductInfo.init()
    private var isClientDeleted = false
    
    private func initInfo() {
        oppo = DataReader.getCurrentOppo()
        self.title = oppo.getName()
        client = DataReader.getClientWithId(oppo.getClientId())
        if client.getName() == "" {
            client = DataReader.getClientFromDelList(oppo.getClientId())
            isClientDeleted = true
        }
        
        tf_client.text = client.getName()
        if client.getName() == "" {
            tf_client.text = "客户不存在"
        }
        product = DataReader.getProductWithId(oppo.getProductId())
        tf_name.text = oppo.getName()
        tf_stage.text = Stage.getContextWithPercentage(oppo.getStage())
        tf_target.text = String(oppo.getTargetSales())
        tf_product.text = product.getName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        DataReader.isCreatingFollowFromClient = false
        self.tabBarController?.tabBar.hidden = true
        initInfo()
        creatFollowViews()
        scrollView.contentSize = CGSize.init(width: _w, height: FollowViewBuilder.currentY + 30)
        MyCloud.getURLsFromCloud()
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
