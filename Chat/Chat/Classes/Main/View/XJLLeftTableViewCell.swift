//
//  XJLLeftTableViewCell.swift
//  Chat
//
//  Created by XJL on 16/8/12.
//  Copyright © 2016年 Xujiali. All rights reserved.
//

import UIKit

class XJLLeftTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    // MARK:- 定义的属性
//    var leftCell : XJLModel? = {
//        didSet{
//            self.iconImage.image = UIImage(named: "sound_Effect", inBundle: nil, compatibleWithTraitCollection: nil)
//            self.titleLabel.text = "亚历山大的弟弟"
//            self.detailLabel.text = "一枚忧伤的美男纸。。。。。。"
//        }
//    }
}

extension XJLLeftTableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}