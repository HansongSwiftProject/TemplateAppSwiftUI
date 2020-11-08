//
//  NavigationItemViewCell.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import Foundation
class ZoomLabel: UILabel, ZoomAction {
    
}
class NavigationItemViewCell: UICollectionViewCell {
    
    var titleStr: ZoomLabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        
        titleStr = ZoomLabel.init(frame: CGRect(x: 0, y: 0, width: self.mj_w, height: self.mj_h))
        titleStr.font = UIFont.boldSystemFont(ofSize: 20)
        titleStr.textAlignment = .center
        self.addSubview(titleStr)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
