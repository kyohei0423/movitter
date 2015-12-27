//
//  ViewController.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "TimelineView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! TimelineView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "newPost", style: .Plain, target: self, action: "tapNewPostButton")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapNewPostButton() {
        performSegueWithIdentifier("ModalChoosePhotoViewController", sender: nil)
    }
    

}

