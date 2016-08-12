//
//  XJLChatViewController.swift
//  Chat
//
//  Created by XJL on 16/8/12.
//  Copyright © 2016年 Xujiali. All rights reserved.
//

import UIKit

class XJLChatViewController: UIViewController {

    // MARK:- 连线的属性
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    
    // MARK:- 定义的属性
    let leftTableViewCellID = "leftTableViewCell"
    let rightTableViewCellID = "rightTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.leftTableView.registerNib(UINib.init(nibName: "XJLLeftTableViewCell", bundle: nil), forCellReuseIdentifier: leftTableViewCellID)
//        self.leftTableView.registerClass(XJLLeftTableViewCell.self, forCellReuseIdentifier: leftTableViewCellID)
        
        self.rightTableView.registerNib(UINib.init(nibName: "XJLRightTableViewCell", bundle: nil), forCellReuseIdentifier: rightTableViewCellID)
//        self.rightTableView.registerClass(XJLRightTableViewCell.self, forCellReuseIdentifier: rightTableViewCellID)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension XJLChatViewController{
    
    @IBAction func leftBtnClick(sender: UIButton) {
        
        leftLine.backgroundColor = UIColor.redColor()
        rightLine.backgroundColor = UIColor.grayColor()
        
        leftTableView.hidden = false
        rightTableView.hidden = true
        
    }
    
    @IBAction func rightBtnClick(sender: UIButton) {
        
        leftLine.backgroundColor = UIColor.grayColor()
        rightLine.backgroundColor = UIColor.redColor()
        
        leftTableView.hidden = true
        rightTableView.hidden = false
    }
    
}

//     MARK: - Table view data source
extension XJLChatViewController:UITableViewDataSource{
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if leftTableView.hidden == false {
            let cell = tableView.dequeueReusableCellWithIdentifier(leftTableViewCellID, forIndexPath: indexPath) as! XJLLeftTableViewCell
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(rightTableViewCellID, forIndexPath: indexPath) as! XJLRightTableViewCell
            
            return cell
        }
        
    }
}