//
//  OppoTableViewController.swift
//  Yeah_SalesExpert
//
//  Created by DavisChing on 16/5/18.
//  Copyright © 2016年 DavisChing. All rights reserved.
//

import UIKit

class OppoTableViewController: UITableViewController {
    
    var dataTable : UITableView!
    let screenObject = UIScreen.mainScreen().bounds
    
    private var oppoCount : Int = DataReader.getOppoCount()
    private var oppoList = DataReader.getOppoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    private func updateContactData(){
        oppoCount = DataReader.getOppoCount()
        oppoList = DataReader.getOppoList()
    }
    
    private func initCells() {
        let dataTabelW : CGFloat = screenObject.width
        let dataTabelH : CGFloat = 75 * (CGFloat(oppoCount) + 10)
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
        return oppoCount + 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let id = "id";
        var cell = tableView.dequeueReusableCellWithIdentifier(id)
        
        let index = indexPath.row
        
        if index < oppoCount {
            if cell == nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.Value1, reuseIdentifier: id)
            }
            
            //cell.contentView.subviews lastObject] removeFromSuperview
            
            while cell?.contentView.subviews.last != nil {
                cell?.contentView.subviews.last?.removeFromSuperview()
            }
            
            cell?.textLabel?.text = "\(index + 1)) " + oppoList[index].getName()
            
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
        if indexPath.row < oppoCount {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            DataReader.setCurrentOppo(oppoList[indexPath.row], _currentOppoIndex: indexPath.row)
            
            let contactInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let contactInfoView = contactInfoStoryBoard.instantiateViewControllerWithIdentifier("OppoInfoViewController")
            self.navigationController?.pushViewController(contactInfoView, animated: true)
        } else {
            let contactInfoStoryBoard = UIStoryboard.init(name: "Index", bundle: nil)
            let contactaddView = contactInfoStoryBoard.instantiateViewControllerWithIdentifier("NewOppoViewController")
            self.navigationController?.pushViewController(contactaddView, animated: true)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
        updateContactData()
        initCells()
        self.title = "销售机会(\(oppoCount))"
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.title = "销售机会"
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
