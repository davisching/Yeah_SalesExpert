//
//  ClientInfoViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/16.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class ClientInfoViewController: UIViewController , UIAlertViewDelegate{

    var clientInfo = ClientInfo.init()
    
    @IBOutlet weak var bt_tap: UIButton!
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_company: UITextField!
    @IBOutlet weak var tf_job: UITextField!
    @IBOutlet weak var tf_mobile: UITextField!
    @IBOutlet weak var tf_phone: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tf_visit: UITextField!
    
    @IBAction func bt_visit(sender: AnyObject) {
        if DataReader.getCurrentClient().getUserId() == DataReader.getCurrentUser().getId() {
            clientInfo.setVisit(clientInfo.getVisit() + 1)
            
            let today:NSDate = NSDate()
            let dateFormatter = NSDateFormatter()
            
            dateFormatter.dateFormat = "YYYY"
            let year = Int(dateFormatter.stringFromDate(today))
            dateFormatter.dateFormat = "MM"
            let month = Int(dateFormatter.stringFromDate(today))
            dateFormatter.dateFormat = "dd"
            let day = Int(dateFormatter.stringFromDate(today))
            
            clientInfo.appendList(Check.init(YY: year!, MM: month!, DD: day!, _context: "我拜访了这个客户", _userId: DataReader.getCurrentUser().getId()))
            
            DataReader.modifyClient(clientInfo)
            
            let storyBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let refreshView = storyBoard.instantiateViewControllerWithIdentifier("RefreshViewController")
            self.navigationController?.pushViewController(refreshView, animated: false)
            
            let alert = UIAlertView.init(title: "拜访成功", message: "已经成功的记录了此次拜访！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()

        } else {
            let alert = UIAlertView.init(title: "没有权限", message: "只有创建者可以进行此项操作！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        }
    }
    
    @IBAction func bt_del(sender: AnyObject) {
        
        if DataReader.getCurrentClient().getUserId() == DataReader.getCurrentUser().getId() {
        
            let alert = UIAlertView.init(title: "确认删除操作", message: "客户删除后，数据将无法恢复！", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确认删除")
            alert.show()
        } else {
            let alert = UIAlertView.init(title: "没有权限", message: "只有创建者可以进行此项操作！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            delTheClient()
        }
    }
    
    private func delTheClient() {
        DataReader.delCurrentClient()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func bt_addFollow(sender: AnyObject) {
        let clientInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
        let clientaddView = clientInfoStoryBoard.instantiateViewControllerWithIdentifier("NewFollowViewController")
        self.navigationController?.pushViewController(clientaddView, animated: true)
    }
    
    @IBAction func bt_tap(sender: UIButton) {
        tf_name.resignFirstResponder()
        tf_company.resignFirstResponder()
        tf_job.resignFirstResponder()
        tf_mobile.resignFirstResponder()
        tf_phone.resignFirstResponder()
        tf_email.resignFirstResponder()
    }
    
    @IBAction func bt_modify(sender: AnyObject) {
         if DataReader.getCurrentClient().getUserId() == DataReader.getCurrentUser().getId() {
        if tf_name.text == "" {
            let alert = UIAlertView.init(title: "需要名称", message: "请为此客户添加一个名称！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        } else {
            modifyAClient()
        }
         } else {
            let alert = UIAlertView.init(title: "没有权限", message: "只有创建者可以进行此项操作！", delegate: nil, cancelButtonTitle: "返回")
            alert.show()
        }
    }
    
    func modifyAClient(){
        let newClient = clientInfo
        newClient.setName(tf_name.text!)
        newClient.setCompany(tf_company.text!)
        newClient.setJob(tf_job.text!)
        newClient.setMobile(tf_mobile.text!)
        newClient.setPhone(tf_phone.text!)
        newClient.setEmail(tf_email.text!)
        DataReader.modifyClient(newClient)
        
        let alert = UIAlertView.init(title: "更新成功", message: "客户的信息已经被成功的更新了!", delegate: nil, cancelButtonTitle: "我知道了！")
        alert.show()
    }
    
    func createFollowViews() {
        let followViewBuilder = FollowViewBuilder.init()
        let checkList = clientInfo.getCheckList()
        let count = checkList.count
        for i in 0 ..< count {
            let _view = followViewBuilder.getView(checkList[count - i - 1])
            scrollView.addSubview(_view)
        }
    }
    
    let _w : CGFloat = UIScreen.mainScreen().bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize.init(width: _w, height: FollowViewBuilder.currentY + 70)
        transAll()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        clientInfo = DataReader.getCurrentClient()
        self.title = clientInfo.getName()
        tf_name.text = clientInfo.getName()
        tf_company.text = clientInfo.getCompany()
        tf_job.text = clientInfo.getJob()
        tf_mobile.text = clientInfo.getMobile()
        tf_phone.text = clientInfo.getPhone()
        tf_email.text = clientInfo.getEmail()
        tf_visit.text = String(clientInfo.getVisit())
        createFollowViews()
        DataReader.isCreatingFollowFromClient = true
        self.tabBarController?.tabBar.hidden = true
        createFollowViews()
        scrollView.contentSize = CGSize.init(width: _w, height: FollowViewBuilder.currentY + 70)
        MyCloud.getURLsFromCloud()
    }
    
    override func viewWillDisappear(animated: Bool) {
         //DataReader.isCreatingFollowFromClient = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Turn all UI into suitable size for each kinds of iphone
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
