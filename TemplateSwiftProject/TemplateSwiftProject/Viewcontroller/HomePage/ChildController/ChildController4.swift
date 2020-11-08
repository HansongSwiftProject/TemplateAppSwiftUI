//
//  ChildController4.swift
//  TemplateSwiftProject
//
//  Created by hansong on 11/8/20.
//

import UIKit

class ChildController4: CFBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleStr = UILabel.init(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        titleStr.font = UIFont.boldSystemFont(ofSize: 20)
        titleStr.textAlignment = .center
        titleStr.text = "热点"
        titleStr.textColor = UIColor.darkText
        view.addSubview(titleStr)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
