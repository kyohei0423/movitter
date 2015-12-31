//
//  MovieView.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import AVFoundation

class MovieView: UIView {
    //録画ボタン
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var backRecordButtonView: UIView!
    @IBOutlet weak var outerRecordButtonImageView: UIImageView!
    @IBOutlet weak var captureView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //カメラから取得したプレビューを表示するためのダミービュー
        captureView.frame.origin = CGPointZero
        let captureViewLength: CGFloat = self.frame.width
        captureView.frame.size = CGSize(width: captureViewLength, height: captureViewLength)
        
        //recordButtonの後ろに配置するview
        backRecordButtonView.frame.origin = CGPoint(x: 0, y: captureViewLength)
        backRecordButtonView.frame.size = CGSize(width: captureViewLength, height: self.frame.height - captureViewLength)
        
        //recordButton
        recordButton.center = CGPoint(x: backRecordButtonView.center.x, y: backRecordButtonView.center.y)
        recordButton.frame.size = CGSize(width: 80, height: 60)
        
        //recordButton周りの輪のimageView
        outerRecordButtonImageView.center = CGPoint(x: recordButton.center.x, y: recordButton.center.y)
        outerRecordButtonImageView.frame.size = CGSize(width: 66, height: 66)
    }
}
