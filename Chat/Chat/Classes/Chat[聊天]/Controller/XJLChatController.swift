//
//  XJLChatController.swift
//  Chat
//
//  Created by XJL on 16/8/13.
//  Copyright © 2016年 Xujiali. All rights reserved.
//

import UIKit

class XJLChatController: UIViewController {
    
    // MARK:- 连线的属性
    /** InputToolBar 的底部约束*/
    @IBOutlet weak var inputToolBarBottomConst: NSLayoutConstraint!
    /** InputToolBar 的高度约束*/
    @IBOutlet weak var inputToolBarHeightConst: NSLayoutConstraint!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var inputTextView: UITextView!
        
    // MARK:- 懒加载
    /** 数组存储数据*/
    lazy var data : NSMutableArray = {
        return NSMutableArray()
    }()
    
    lazy var popView : XHPopMenu = {
        
        let item1 = XHPopMenuItem(title: "         备注损友")
        let item2 = XHPopMenuItem(title: "         关注损友")
        let item3 = XHPopMenuItem(title: "     添加至黑名单")

        
        var popView = XHPopMenu(menus: [item1,item2,item3])
        
        return popView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        inputTextView.becomeFirstResponder()
        setUpItem()
        //模拟数据
        self.data.addObject("1234566底部约束")
        self.data.addObject("1234566底部约束1234214底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束434底部约束")
        self.data.addObject("1234566底部约束1234214底部约束42134底部约束44底部约束42134底部约束44底部约束")
        self.data.addObject("1234566底部约束1234214底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134底部约束44底部约束42134")
        self.data.addObject("1234566底部约束")
    }

    override func viewWillAppear(animated: Bool) {
        
        setupKeyBoardNotification()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        customTableView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}

//自定义方法
extension XJLChatController{
    
    func setUpItem(){
        //左边的Item
        let leftItem = UIBarButtonItem(image: UIImage(named: "sound_Effect"), style: .Plain, target: self, action: "leftClickAction:")
        self.navigationItem.leftBarButtonItem = leftItem
        //右边的Item
        let rightItem = UIBarButtonItem(image: UIImage(named: "sound_Effect"), style: .Plain, target: self, action: "rightClickAction:")
        self.navigationItem.rightBarButtonItem = rightItem

    }
    
    func setupKeyBoardNotification(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(XJLChatController.keyBoardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
    }
    
    func keyBoardWillShow(note : NSNotification){
        // 1.获取键盘的高度
        let kbEndFrm = note.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue()
        let kbHeight = kbEndFrm?.size.height
        
        self.inputToolBarBottomConst.constant = kbHeight!
    }
    
    func keyBoardWillHide(note : NSNotification){
        self.inputToolBarBottomConst.constant = 0
    }
    
    func leftClickAction(item : UIBarButtonItem){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func rightClickAction(item : UIBarButtonItem){
        _ = popView
        popView.showMenuAtPoint(CGPointMake(0, 0))
        
    }
}

// MARK:- 监听文本内容的改变
extension XJLChatController : UITextViewDelegate{
    func textViewDidChange(textView: UITextView) {
        var textHeight = textView.contentSize.height
        if textHeight > 68 {
            textHeight = 67
        }
        
        self.inputToolBarHeightConst.constant = 5 + textHeight + 6
        if textView.text.hasSuffix("\n") {
            textView.text = ""
            self.inputToolBarHeightConst.constant = 44
            
        }
    }
    
}

// MARK:- 表格的数据源
extension XJLChatController : UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let senderCellID = "senderCell"
        let receiveCellID = "receiveCell"
        
        let cell : XJLMessageViewCell
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(senderCellID)
            
            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(receiveCellID)
            
            return cell!
        }
        cell.messageLabel.text = self.data[indexPath.row] as? String;
        return cell
    }
    
}

// MARK:- 代理方法
extension XJLChatController : UITableViewDelegate{

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let text = self.data[indexPath.row]
        let size = CGSizeMake(240,CGFloat(MAXFLOAT))
        let textHeight = text.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, context: nil).size.height
        
//        let textHeight = text.boundingRectWithSize(size , options: NSStringDrawingOptions.UsesLineFragmentOrigin , attributes : NSDictionary(object:UIFont.systemFontOfSize(15), forKey: NSFontAttributeName) as [NSObject : AnyObject], context:nil ).size.height
        
        return 25 + textHeight + 25
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let alertVc = UIAlertController(nibName: "XJLAlertController", bundle: nil)
        alertVc.addAction(UIAlertAction(title: "确定", style: .Default, handler: nil))
        self.presentViewController(alertVc, animated: true, completion: nil)

    }

}

// MARK:- 底部按钮的点击
extension XJLChatController{
    
    @IBAction func addBtnClick(sender: UIButton) {
        // 0.退出键盘
        customTableView.resignFirstResponder()
        
        // 1.获取键盘的高度
        self.inputToolBarBottomConst.constant = 258
        
        // 2.执行动画
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func expressionBtnClick(sender: UIButton) {
        
    }
    
    @IBAction func voiceBtnClick(sender: UIButton) {
        
    }
}

// MARK:- 设置
extension XJLChatController{
    // MARK:- 懒加载属性
    
    
    // 2.设置子控件的位置
    
}

