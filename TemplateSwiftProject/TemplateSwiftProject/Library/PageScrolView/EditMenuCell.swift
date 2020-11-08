//
//  EditMenuCell.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import Foundation
import UIKit

class MenuButton: UIButton {
    
    var indexPath: IndexPath!
    
}
class EditMenuCell: UICollectionViewCell {
    var editButton: MenuButton!
    var titleStr: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
        self.backgroundColor = UIColor.white
        
        editButton = MenuButton(type: .custom)
        editButton.frame = CGRect(x: mj_w - 25, y: 0, width: 25, height: 25)
        editButton.setTitleColor(.red, for: .normal)
        editButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.contentView.addSubview(editButton)
        
        titleStr = UILabel.init(frame: CGRect(x: 15, y: self.mj_w - 40, width: self.mj_w - 30, height: 20))
        titleStr.font = UIFont.systemFont(ofSize: 14)
        titleStr.textColor = UIColor.black
        self.contentView.addSubview(titleStr)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
