//
//  XJLMessageViewCell.swift
//  Chat
//
//  Created by XJL on 16/8/13.
//  Copyright © 2016年 Xujiali. All rights reserved.
//

import UIKit

class XJLMessageViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var chatBgImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        chatBgImage.userInteractionEnabled = true

    }

}
