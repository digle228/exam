//
//  CellTableViewCell.swift
//  CoffeeShop
//
//  Created by wusuchen on 2016/1/21.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var shopImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
