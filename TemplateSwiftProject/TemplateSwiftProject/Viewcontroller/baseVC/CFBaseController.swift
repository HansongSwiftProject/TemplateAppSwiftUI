//
//  CFBaseController.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import UIKit

class CFBaseController: UIViewController {
    var headerColor: UIColor!//视图往下滑动时,头部的遮罩颜色
    var headFillView: UIView!//视图往下滑动时,头部的遮罩视图
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //ScrollView类型的视图拉伸时头部填充视图
        headFillView = UIView.init(frame: CGRect(x: 0, y: 0, width: view.mj_w, height: 0.01))
        headFillView.backgroundColor = headerColor
        view.addSubview(headFillView)
    }
}
