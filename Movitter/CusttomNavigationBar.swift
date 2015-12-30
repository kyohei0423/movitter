//
//  CusttomNavigationBar.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/30.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class CusttomNavigationBar: UINavigationBar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.translucent = false
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    }

}
