//
//  XJLSenderTextView.swift
//  Chat
//
//  Created by XJL on 16/8/13.
//  Copyright © 2016年 Xujiali. All rights reserved.
//

import UIKit

class XJLSenderTextView: UITextView {

    // MARK:- 懒加载属性
    lazy var placeHolderLabel : UILabel = UILabel()
    
    // MARK:- 构造函数
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
}

extension XJLSenderTextView{
    private func setupUI() {
        // 1.添加子控件
        addSubview(placeHolderLabel)
        
        // 2.设置子控件的位置
        placeHolderLabel.snp_makeConstraints { (make) -> Void in
            make.centerWithinMargins
        }
        
        // 3.设置属性
        placeHolderLabel.font = font
        placeHolderLabel.textColor = UIColor.lightGrayColor()
        placeHolderLabel.text = "回复内容"
        
        self.textContainerInset = UIEdgeInsets(top: 8, left: 7, bottom: 0, right: 7)
    }
}

