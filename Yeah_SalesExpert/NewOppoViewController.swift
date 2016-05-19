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
        
    }
    
    @IBAction func bt_product(sender: AnyObject) {
        
    }
    
    @IBAction func bt_add(sender: AnyObject) {
        
    }
    
    private var client = ClientInfo.init()
    
    func setClient(_client: ClientInfo) {
        client = _client
        if client.getCompany() != "" {
            tf_client.text = client.getName() + " (来自 " + client.getCompany() + ")"
        } else {
            tf_client.text = client.getName()
        }
        
    }
    
    func initText() {
        setClient(DataReader.getSelectClient())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
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

}
