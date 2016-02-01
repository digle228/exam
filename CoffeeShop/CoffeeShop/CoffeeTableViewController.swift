//
//  CoffeeTableViewController.swift
//  CoffeeShop
//
//  Created by wusuchen on 2016/1/21.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse

class CoffeeTableViewController: UITableViewController {
    
    
    var coffeeArray:[PFObject]!
    
    
    // 將新增資料帶出
    func CreateStoreNoti(noti: NSNotification){
        let store = noti.userInfo! ["store"] as! PFObject
        self.coffeeArray.insert(store, atIndex: 0)
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Automatic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let query = PFQuery(className: "CoffeeStore")
        query.findObjectsInBackgroundWithBlock { (array:[PFObject]?, err:NSError?) -> Void in
            
            if let array = array {
                self.coffeeArray = array
                self.tableView.reloadData()
            }
            
        }
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "CreateStoreNoti:", name: "CreateStoreNoti", object: nil)
        
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
        if self.coffeeArray == nil  {
            return 0
        }
        else {
            return self.coffeeArray.count
            
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! CellTableViewCell
        
        let shop = self.coffeeArray[indexPath.row]
        
        cell.nameLabel.text = shop["name"] as? String
        cell.addressLabel.text = shop["address"] as? String
        
        let photoFile = shop["photo"] as? PFFile
        if let urlStrin = photoFile?.url {
            let url = NSURL(string: urlStrin)
            let request = NSURLRequest(URL: url!)
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, res:NSURLResponse?, err:NSError?) -> Void in
                
                if let data = data {
                    let image = UIImage(data: data)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        cell.shopImage.image = image
                    })
                    
                    
                    
                }
                
                
            })
            task.resume()
        }
        
        
        
        
        return cell
    }
    
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
