//
//  ViewController.swift
//  DropMenuDemo
//
//  Created by 王 on 2017/3/21.
//  Copyright © 2017年 atm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dropMenu = DropMenu(y: 64)
        dropMenu.parse(["第一","第二"])
        dropMenu.clickCell = self.clickCell
        self.view.addSubview(dropMenu)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func clickCell(index:Int){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

