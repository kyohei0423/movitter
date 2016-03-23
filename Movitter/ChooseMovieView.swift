//
//  NewPostView.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class ChoosePhotoView: UIView {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        previewView.frame.origin = CGPointZero
        previewView.frame.size = CGSize(width: self.frame.width, height: self.frame.width)
        
        movieCollectionView.frame.origin = CGPoint(x: 0, y: self.frame.height)
        movieCollectionView.frame.size = CGSize(width: self.frame.width, height: self.frame.height - self.frame.width)
    }
    
    
}
