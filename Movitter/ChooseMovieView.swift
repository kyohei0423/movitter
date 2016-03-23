//
//  NewPostView.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class ChooseMovieView: UIView {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        previewView.frame.origin = CGPointZero
        previewView.frame.size = CGSize(width: self.frame.width, height: self.frame.width)
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        
        movieCollectionView.registerNib(nib, forCellWithReuseIdentifier: "MovieCollectionViewCell")
        setCollectionViewFlowLayout()
    }
    
    private func setCollectionViewFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        let itemLength = frame.width / 3
        flowLayout.itemSize = CGSize(width: itemLength, height: itemLength)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        movieCollectionView.collectionViewLayout = flowLayout
    }
    
}
