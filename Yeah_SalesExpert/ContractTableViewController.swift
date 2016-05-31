//
//  ContractTableViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/31.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class ContractTableViewController: UITableViewController {
    
    var dataTable : UITableView!
    let screenObject = UIScreen.mainScreen().bounds
    
    private var contractCount = 0
    private var contractList = [ContractInfo]()
    
    /*Part stands for whether the user is searching the clients by
     0 . User itself
     1 . His or her company */
    private var part = 0
    
    @IBAction func bt_refresh(sender: AnyObject) {
        
        if DataReader.isSearchingOppoWithAClient != true {
            
            MyCloud.getURLsFromCloud()
            
            if part == 0 {
                part = 1
            } else {
                part = 0
            }
            updateOppoData()
            initCells()
        }
        
    }
    
    private func updateOppoData(){
        
        if DataReader.isSearchingOppoWithAClient != true {
            
            if part == 0 {
                contractList = DataReader.getContractListForCurrentUser()
                contractCount = contractList.count
                self.title = "我的合同(\(contractCount))"
            } else {
                contractList = DataReader.getContractListForCurrentCom()
                contractCount = contractList.count
                self.title = "公司合同(\(contractCount))"
            }
        } else {
            
            contractList = DataReader.getContractListForCurrentClient();
            contractCount = contractList.count
            self.title = "\(DataReader.getCurrentClient().getName())的合同(\(contractCount))"
        }
    }
    
    @IBAction func bt_add(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    private func initCells() {
        let dataTabelW : CGFloat = screenObject.width
        let dataTabelH : CGFloat = 75 * (CGFloat(contractCount) + 10)
        let dataTabelX : CGFloat = 0
        let dataTabelY : CGFloat = 0
        dataTable = UITableView.init(frame: CGRect.init(x: dataTabelX, y: dataTabelY, width: dataTabelW, height: dataTabelH))
        dataTable.delegate = self
        dataTable.dataSource = self
        self.view.addSubview(self.dataTable)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contractCount + 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let id = "id";
        var cell = tableView.dequeueReusableCellWithIdentifier(id)
        
        let index = indexPath.row
        
        if index < contractCount {
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: id)
            }
            
            //cell.contentView.subviews lastObject] removeFromSuperview
            
            while cell?.contentView.subviews.last != nil {
                cell?.contentView.subviews.last?.removeFromSuperview()
            }
            
            cell?.textLabel?.text = "\(index + 1)) " + contractList[index].getName()
            
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        } else {
            if cell == nil {
                cell = UITableViewCell.init()
            }
        }
        
        cell?.textLabel?.textColor = UIColor.whiteColor()
        
        tableView.backgroundColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        cell?.backgroundColor = UIColor.init(red: 0.33, green: 0.33, blue: 0.3, alpha: 1)
        
        //tableView.scrollEnabled = true
        
        // Configure the cell...
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row < contractCount {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            DataReader.setCurrentContract(contractList[indexPath.row])
            
            let storyBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let newView = storyBoard.instantiateViewControllerWithIdentifier("ContractInfoViewController")
            self.navigationController?.pushViewController(newView, animated: true)
        } else {
            let storyBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let newView = storyBoard.instantiateViewControllerWithIdentifier("NewContractViewController")
            self.navigationController?.pushViewController(newView, animated: true)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationBarHidden = false
        updateOppoData()
        initCells()
        DataReader.clearAllSelected()
        MyCloud.getURLsFromCloud()
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
