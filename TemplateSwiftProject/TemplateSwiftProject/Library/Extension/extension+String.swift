//
//  extension+String.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import Foundation
extension String {
    
    func sizeWithText(font: UIFont, size: CGSize) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = self.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect.size;
    }
}
