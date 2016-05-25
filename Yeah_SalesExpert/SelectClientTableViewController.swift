//
//  SelectClientTableViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/19.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class SelectClientTableViewController: UITableViewController {

    var dataTable : UITableView!
    let screenObject = UIScreen.mainScreen().bounds
    
    private var clientCount : Int = DataReader.getClientCount()
    private var clientList = DataReader.getClientList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCells()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    private func updateClientData(){
        clientCount = DataReader.getClientCount()
        clientList = DataReader.getClientList()
    }
    
    private func initCells() {
        let dataTabelW : CGFloat = screenObject.width
        let dataTabelH : CGFloat = 75 * (CGFloat(clientCount) + 1)
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
        
        return clientCount + 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    
    //    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 0
    //    }
    //
    //    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 0
    //    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let id = "id";
        var cell = tableView.dequeueReusableCellWithIdentifier(id)
        
        let index = indexPath.row - 1
        
        if index < clientCount + 1 {
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: id)
            }
            
            //cell.contentView.subviews lastObject] removeFromSuperview
            
            while cell?.contentView.subviews.last != nil {
                cell?.contentView.subviews.last?.removeFromSuperview()
            }
            
            if indexPath.row == 0 {
                cell?.textLabel?.text = "+  使用新客户"
            } else {
                cell?.textLabel?.text = "\(index + 1))  " + clientList[index].getName() + "   " + clientList[index].getCompany()
                cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
           
        } else {
            if cell == nil {
                cell = UITableViewCell.init()
            }
        }
        
        cell?.textLabel?.textColor = UIColor.whiteColor()
        
        tableView.backgroundColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.32, alpha: 1)
        cell?.backgroundColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.32, alpha: 1)
        
        //tableView.scrollEnabled = true
        
        // Configure the cell...
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //If user choose to use a existed client
        if indexPath.row != 0 {
            DataReader.setSelectedClient(clientList[indexPath.row - 1])
            self.navigationController?.popViewControllerAnimated(true)
        } else {
           
             DataReader.isCreatingAnOppotunity = true
            
            let clientInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let clientaddView = clientInfoStoryBoard.instantiateViewControllerWithIdentifier("NewClientViewController")
            self.navigationController?.pushViewController(clientaddView, animated: true)
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = true
        updateClientData()
        initCells()
        self.title = "选择一个客户"
        
        if DataReader.isCreatingAnOppotunity == true {
            self.navigationController?.popViewControllerAnimated(true)
            DataReader.clearIsCreatingAnOppotunity()
        }
        MyCloud.updateURLS()
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
