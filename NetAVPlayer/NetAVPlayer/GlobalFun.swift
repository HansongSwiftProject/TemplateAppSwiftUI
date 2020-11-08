//
//  GlobalFun.swift
//  NetAVPlayer
//
//  Created by hansong on 11/8/20.
//

import Foundation
import UIKit
func RGB(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
}

func swiftClassFromString(className: String) -> AnyClass! {
 
    if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {

        let classStringName = appName + "." + className
        return NSClassFromString(classStringName)
    }
    return nil;
}
