//
//  ViewController.swift
//  TabelViewEdit
//
//  Created by 彭盛凇 on 16/9/9.
//  Copyright © 2016年 huangbaoche. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let screenWidth     = UIScreen.mainScreen().bounds.size.width
    let screenHeight    = UIScreen.mainScreen().bounds.size.height
    let identifier      = "cellID"
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRectMake(0, 0, self.screenWidth, self.screenHeight), style: .Plain)
        tableView.rowHeight = 100
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    lazy var dataList:NSArray = {
        var array = NSMutableArray()
        for index in 0...100 {
            array.addObject("\(index)")
        }
       return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
//MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.textLabel?.text = dataList[indexPath.row] as? String ?? ""
        return cell
    }
    
//MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(#function)")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // Editing
    
    //是否可以编辑
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //修改delete文案
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        print("\(#function)")
        return "删除"
    }
    
    //点击左滑按钮响应时间
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        print("\(#function)")
        
        switch editingStyle {
            
        case .None:
            print("None")
        case .Delete:
            print("Delete")
        case .Insert :
            print("Insert")
        }
    }
    
    //自定义
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        print("\(#function)")
        
        let firstButton = UITableViewRowAction(style: .Default, title: "button1") { (UITableViewRowAction, NSIndexPath) in
            //点击事件
        }
        
        let secondButton = UITableViewRowAction(style: .Normal, title: "button2") { (UITableViewRowAction, NSIndexPath) in
            //点击事件
        }
        
        let thirdButton = UITableViewRowAction(style: .Destructive, title: "button3") { (UITableViewRowAction, NSIndexPath) in
            //点击事件
        }

        return [firstButton, secondButton, thirdButton]
    }

    //允许定制的特定cell位于editingStyle“indexPath”。如果没有实现,所有可编辑的cell会有UITableViewCellEditingStyleDelete设置为他们当表编辑属性设置为YES。
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        print("\(#function)")
        return .Delete
    }

    //背景是否缩进在编辑控件。如果没有实现,默认是Yes。这是与下面的缩进级别无关。这种方法只适用于组合样式表视图。
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        print("\(#function)")
        return true
    }

    //willBegin/didEnd 方法当编辑的属性是由表自动改变(允许插入/删除/移动)。这是通过激活一行一个猛击
    //将要开始编辑
    func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        print("\(#function)")
    }
    
    //结束编辑
    func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath?) {
        print("\(#function)")
    }
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.transform = CGAffineTransformMakeTranslation(320, 0)
        
        UIView.animateWithDuration(0.5) {

            cell.transform = CGAffineTransformIdentity

        }
    }
}
