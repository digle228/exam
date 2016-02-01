//
//  PhotoTableViewController.swift
//  CoffeeShop
//
//  Created by wusuchen on 2016/1/22.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse

class PhotoTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {


    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var introTextView: UITextView!

    @IBOutlet weak var photoButton: UIButton!
    
    
    
    @IBAction func doneButton(sender: AnyObject) {
        let store = PFObject(className: "CoffeeStore")
        store["name"] = self.nameTextField.text
        store["address"] = self.addressTextField.text
        store["telephone"] = self.phoneTextField.text
        store["website"] = self.websiteTextField.text
        store["introduction"] = self.introTextView.text
        
        
        //上傳照片
        let imageData = UIImageJPEGRepresentation(self.photoButton.imageView!.image!, 0.8)
        let imageFile = PFFile(data: imageData!)
        store["photo"]  = imageFile
        
        //  refresh首頁功能
        store.saveInBackgroundWithBlock { (result:Bool, err:NSError?) -> Void in
            if result {
                self.navigationController?.popViewControllerAnimated(true)
                NSNotificationCenter.defaultCenter().postNotificationName("CreateStoreNoti", object: nil, userInfo: ["store" : store])
                
            }else {
                
            }
        }
        
        
    }
    // 選照片的func
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
        self.photoButton.setImage(image, forState: .Normal)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    // 選照片的Button

    @IBAction func photoButtonPressed(sender: AnyObject) {
        let controller = UIImagePickerController()
        controller.sourceType = .PhotoLibrary
        controller.delegate = self
        self.presentViewController(controller, animated: true, completion: nil )
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoButton.imageView?.contentMode = .ScaleAspectFill
        
        introTextView.layer.borderColor = UIColor.blackColor().CGColor
        introTextView.layer.borderWidth = 1
        
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
////
////    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // #warning Incomplete implementation, return the number of rows
////        return 6
////    }

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
