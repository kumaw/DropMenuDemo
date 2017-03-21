//
//  DropMenu.swift
//  MiaoCai
//
//  Created by 王 on 2016/12/23.
//  Copyright © 2016年 iMac. All rights reserved.
//

import UIKit
var ScreenSize = UIScreen.main.bounds
class DropMenu: UIView {
    var title = DropTitle()
    var bgView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height))
    var fullFrame = CGRect(x: 0, y: 64, width: ScreenSize.width, height: ScreenSize.height)
    var dFrame = CGRect(x: 0, y: 64, width: ScreenSize.width, height: 42)
    var table:DropMenuTable?
    var titleData:[String] = []
    
    var clickCell:(_ index:Int)->Void = { index in
        
    }
    
    init(y:Int) {
        dFrame = CGRect(x: 0, y: y, width: Int(ScreenSize.width), height: 42)
        fullFrame = CGRect(x: 0, y: y, width: Int(ScreenSize.width), height: Int(ScreenSize.height))
        super.init(frame: dFrame)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = false
        title.filterClick = self.click
        self.addSubview(title)
        
    
        let titleLeft = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0)
        let titleTop = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        let titleRight = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0)
        let titleHeight = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 42)
        
        
        
        self.addConstraints([titleLeft,titleTop,titleRight,titleHeight])
        
//        title.snp.makeConstraints { (make) in
//            make.top.equalTo(0)
//            make.left.equalTo(0)
//            make.right.equalTo(0)
//            make.height.equalTo(42)
//        }
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        //表格
        table = DropMenuTable(click: self.clickOneCell,at:42)
        self.addSubview(table!)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(DropMenu.blockClick))
        bgView.addGestureRecognizer(tap)
        
        //加分割线
        //self.addNBBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func blockClick(){
        self.click(false)
    }
    
    func parse(_ data:[String]){
        self.titleData = data
        table?.parse(data)
        self.title.changeTitle(text: titleData[0])
    }
    func defaultIndex(_ index:Int){
        self.table?.defaultIndex = index
    }
    
    func changeTitle(_ text:String){
        self.title.changeTitle(text: text)
    }
    
    func clickOneCell(index:Int){
        self.title.changeTitle(text: titleData[index])
        self.click(false)
        self.clickCell(index)
    }
    
    func click(_ click:Bool){
        if(click){
            self.frame = fullFrame
            self.insertSubview(bgView, belowSubview: title)
            table?.showAt()
        }else{
            self.frame = dFrame
            bgView.removeFromSuperview()
            table?.hide()
            self.title.clicked(false)
        }
    }
    
    
}
