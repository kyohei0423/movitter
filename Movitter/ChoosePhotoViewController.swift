//
//  NewPostViewController.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class ChoosePhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "tapBackButton")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapBackButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
