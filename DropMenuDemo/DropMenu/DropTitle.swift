//
//  DropTitle.swift
//  MiaoCai
//
//  Created by 王 on 2016/12/23.
//  Copyright © 2016年 iMac. All rights reserved.
//

import UIKit

class DropTitle: UIView {
    var title = UILabel()
    var filterView = UIView()
    var filterIcon = UIImageView()
    var filterClick:((_ click:Bool) -> Void)?
    var isClick = false
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.backgroundColor = UIColor.white
        //头部图标
        let view = UIImageView(image: UIImage(named: "drop_menu"))
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        //约束
        let viewLeft = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 15)
        let viewCenterY = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([viewLeft,viewCenterY])
//        view.snp.makeConstraints { (make) in
//            make.left.equalTo(15)
//            make.centerY.equalToSuperview()
//        }
        //title
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 14)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        
        let titleLeft = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 38)
        let titleCenterY = NSLayoutConstraint(item: title, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([titleLeft,titleCenterY])
//        title.snp.makeConstraints { (make) in
//            make.left.equalTo(38)
//            make.centerY.equalToSuperview()
//        }
        //筛选
        
        self.addSubview(filterView)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        let filterViewH = NSLayoutConstraint.constraints(withVisualFormat: "H:[filterView(75)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["filterView":filterView] )
        let filterViewV = NSLayoutConstraint.constraints(withVisualFormat: "V:|[filterView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:["filterView":filterView])
        self.addConstraints(filterViewH)
        self.addConstraints(filterViewV)
        //        filterView.snp.makeConstraints { (make) in
        //            make.top.equalTo(0)
        //            make.right.equalTo(0)
        //            make.bottom.equalTo(0)
        //            make.width.equalTo(75)
        //        }
        
        filterView.addSubview(filterIcon)
        filterIcon.translatesAutoresizingMaskIntoConstraints = false
        let filterIconLeft = NSLayoutConstraint(item: filterIcon, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: filterView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 13)
        let filterIconCenterY = NSLayoutConstraint(item: filterIcon, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: filterView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([filterIconLeft,filterIconCenterY])
//        filterIcon.snp.makeConstraints { (make) in
//            make.left.equalTo(13)
//            make.centerY.equalToSuperview()
//        }
        //文字
        let filterText = UILabel()
        filterText.text = "筛选"
        filterText.font = UIFont.systemFont(ofSize: 14)
        filterText.textColor = UIColor.black
        
        filterView.addSubview(filterText)
        filterText.translatesAutoresizingMaskIntoConstraints = false
        let filterTextRight = NSLayoutConstraint(item: filterText, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: filterView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -13)
        let filterTextCenterY = NSLayoutConstraint(item: filterText, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: filterView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        self.addConstraints([filterTextRight,filterTextCenterY])
        
//        filterText.snp.makeConstraints { (make) in
//            make.right.equalTo(-13)
//            make.centerY.equalToSuperview()
//        }
//        

        clicked(false)
        let tap = UITapGestureRecognizer(target: self, action: #selector(DropTitle.filterHandle))
        filterView.addGestureRecognizer(tap)
        
    }
    
    func filterHandle(){
        let tempClick = !isClick
        self.filterClick!(tempClick)
        self.clicked(tempClick)
    }
    
    func clicked(_ click:Bool){
        if(click){
            filterIcon.image = UIImage(named: "shaixuan_c")
            filterView.backgroundColor = UIColor.white
        }else{
            filterIcon.image = UIImage(named: "shaixuan")
            filterView.backgroundColor = UIColor.clear
        }
        isClick = click
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeTitle(text:String?){
        title.text = text
    }
}
