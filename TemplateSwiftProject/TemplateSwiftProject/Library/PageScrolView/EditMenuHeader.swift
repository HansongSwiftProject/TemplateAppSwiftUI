//
//  EditMenuHeader.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import Foundation
import UIKit

class EditMenuHeader: UICollectionReusableView {
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title = UILabel.init(frame: CGRect(x: 15, y: 0, width: mj_w, height: 20))
        title.textColor = .darkText
        title.font = UIFont.systemFont(ofSize: 16)
        addSubview(title)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
