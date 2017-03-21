//
//  TableViewCell.swift
//  MiaoCai
//
//  Created by 王 on 2016/12/23.
//  Copyright © 2016年 iMac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var textView: UILabel!

    @IBOutlet weak var checkedImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func parse(text:String){
        textView.text = text
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        self.renderSelect(selected)
    }
    
    func renderSelect(_ selected:Bool){
        if(selected){
            self.backgroundColor = UIColor.gray
            self.checkedImg.isHidden = false
        }else{
            self.backgroundColor = UIColor.white
            self.checkedImg.isHidden = true
        }
    }
    
}
