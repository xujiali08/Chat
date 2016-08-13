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
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    @IBOutlet weak var rightLineHeight: NSLayoutConstraint!
    @IBOutlet weak var leftLineHeight: NSLayoutConstraint!
    
    // MARK:- 定义的属性
    let leftTableViewCellID = "leftTableViewCell"
    let rightTableViewCellID = "rightTableViewCell"
    var cellArray : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.leftTableView.registerNib(UINib.init(nibName: "XJLLeftTableViewCell", bundle: nil), forCellReuseIdentifier: leftTableViewCellID)

        self.rightTableView.registerNib(UINib.init(nibName: "XJLRightTableViewCell", bundle: nil), forCellReuseIdentifier: rightTableViewCellID)
        
        rightTableView.hidden = true
        leftLine.backgroundColor = UIColor.redColor()
        
        //模拟数据
        self.cellArray.addObject("1234566底部约束")
        self.cellArray.addObject("1234566底部约束")
        self.cellArray.addObject("1234566底部约束")
        self.cellArray.addObject("1234566底部约束")
        self.cellArray.addObject("1234566底部约束")
        self.cellArray.addObject("1234566底部约束1234214底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束434底部约束")
        self.cellArray.addObject("1234566底部约束1234214底部约束42134底部约束44底部约束42134底部约束44底部约束")
        self.cellArray.addObject("1234566底部约束1234214底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension XJLChatViewController{
    
    @IBAction func leftBtnClick(sender: UIButton) {
        
        leftBtn.selected = true
        rightBtn.selected = false
        leftLine.backgroundColor = UIColor.redColor()
        rightLine.backgroundColor = UIColor.grayColor()
        
        leftTableView.hidden = false
        rightTableView.hidden = true
        
    }
    
    @IBAction func rightBtnClick(sender: UIButton) {
        
        leftBtn.selected = false
        rightBtn.selected = true
        leftLine.backgroundColor = UIColor.grayColor()
        rightLine.backgroundColor = UIColor.redColor()
        
        leftTableView.hidden = true
        rightTableView.hidden = false
    }
    
}

//     MARK: - Table view data source
extension XJLChatViewController:UITableViewDataSource{
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.cellArray.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if leftTableView.hidden == false {
            let cell = leftTableView.dequeueReusableCellWithIdentifier(leftTableViewCellID) as! XJLLeftTableViewCell
            
            return cell
            
        }else{
            let cell = rightTableView.dequeueReusableCellWithIdentifier(rightTableViewCellID) as! XJLRightTableViewCell
            
            return cell
        }
    }
    
}

func signBtnClick(btn : UIButton) -> Void {
    
}

//     MARK: - Table view delegate
extension XJLChatViewController:UITableViewDelegate{
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if leftTableView.hidden == false {
            return 66
        }else{
            return 44
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let signAction = UITableViewRowAction(style: .Normal, title: "标记") { (UITableViewRowAction, NSIndexPath) in
            self.leftTableView.editing = false
        }
        
        let deleteAction = UITableViewRowAction(style: .Normal, title: "删除标记") { (UITableViewRowAction, NSIndexPath) in
            self.cellArray.removeObjectAtIndex(indexPath.row)
            self.leftTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Middle)
        }
        
        deleteAction.backgroundColor = UIColor.redColor()
        return [deleteAction,signAction]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let sb = UIStoryboard(name: "XJLChatViewController", bundle: nil)
        let chatVc = sb.instantiateInitialViewController()
        presentViewController(chatVc!, animated: true, completion: nil)
        
    }
}



