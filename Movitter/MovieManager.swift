//
//  MovieManager.swift
//  Movitter
//
//  Created by Seo Kyohei on 2016/01/09.
//  Copyright © 2016年 Kyohei Seo. All rights reserved.
//

import UIKit
import Photos

class MovieManager: NSObject, UICollectionViewDataSource {
    static let sharedMovieManager = MovieManager()
    var movies = [PHAsset]()
    
    func getMoviesFromCameraroll() {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let assets: PHFetchResult = PHAsset.fetchAssetsWithMediaType(.Video, options: options)
        assets.enumerateObjectsUsingBlock { asset, index, stop in
            self.movies.append(asset as! PHAsset)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return movies.count ?? 0
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCollectionViewCell", forIndexPath: indexPath) as! MovieCollectionViewCell
        cell.movieImageView.image = UIImage(named: "miyoshi")
        return cell
    }
}
