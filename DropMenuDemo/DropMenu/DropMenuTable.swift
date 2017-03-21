//
//  DropMenu.swift
//  MiaoCai
//
//  Created by 王 on 2016/12/23.
//  Copyright © 2016年 iMac. All rights reserved.
//

import UIKit

class DropMenuTable: UIView,UITableViewDelegate,UITableViewDataSource {
    static let width = 222
    var height = 326
    var data : [String] = [];
    var tableView = UITableView()
    var y = 0
    var x = Int(ScreenSize.width) - width
    var clickHandle:(_ index:Int)->Void = { index in
        
    }
    var defaultIndex = 0
    init(click:@escaping (_ index:Int)->Void ,at:Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        y = at
        self.clipsToBounds = true
        self.clickHandle = click
        self.tableView.frame = CGRect(x: 0, y: 0, width: DropMenuTable.width, height: height)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.bounces = false
        self.addSubview(self.tableView)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func parse(_ data:[String]){
        self.data = data
        self.tableView.reloadData()
    }
    
    func showAt(){
        let frame = CGRect(x:x, y: y, width: DropMenuTable.width, height: height)
        self.frame = frame
        
    }
    func hide(){
        self.frame = CGRect(x:x, y: y, width: DropMenuTable.width, height: 0)
 
    }
    
    func HasSelected(index:Int){
        self.tableView.selectRow(at: IndexPath.init(row: index, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.top)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.parse(text: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.clickHandle(indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //数据回填
        if(indexPath.row == tableView.indexPathsForVisibleRows?.last?.row && indexPath.section == tableView.indexPathsForVisibleRows?.last?.section){
            
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    let index = IndexPath.init(row: self.defaultIndex, section: 0)
                    self.tableView.selectRow(at: index, animated: false, scrollPosition: UITableViewScrollPosition.none)
                    self.tableView.cellForRow(at: index)?.setSelected(true, animated: false)
                }
            }
            
        }
    }

}
