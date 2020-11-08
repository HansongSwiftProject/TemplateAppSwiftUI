//
//  ViewController.swift
//  NetAVPlayer
//
//  Created by hansong on 11/8/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func bofang(_ sender: UIButton) {
        let vc = DetailController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
    }
}

