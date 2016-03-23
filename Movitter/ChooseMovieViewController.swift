//
//  NewPostViewController.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

class ChooseMovieViewController: UIViewController, UICollectionViewDelegate {
    let movieManager = MovieManager.sharedMovieManager

    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "ChooseMovieView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chooseMovieView = view as! ChooseMovieView
        chooseMovieView.movieCollectionView.delegate = self
        chooseMovieView.movieCollectionView.dataSource = movieManager
        chooseMovieView.movieCollectionView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: "tapBackButton")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let chooseMovieView = view as! ChooseMovieView
        movieManager.getMoviesFromCameraroll()
        chooseMovieView.movieCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapBackButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
