//
//  ViewController.swift
//  CoffeeShop
//
//  Created by wusuchen on 2016/1/21.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    enum editCoffee: ErrorType {
        case moneyProblem
        case ageProblem
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
// 取資料
//        let quary = PFQuery(className: "CoffeeStore")
//        do{
//            let coffeeArray = try quary.findObjects()
//        
//            for data in coffeeArray {
//                print("data \(data)")
//            }
//           
//        }
//        catch {
//            
//        }
    }
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }





}