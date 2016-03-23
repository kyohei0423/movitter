//
//  MovieViewController.swift
//  Movitter
//
//  Created by Seo Kyohei on 2015/12/27.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class MovieViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {
    
    //AVCaptureSession
    let captureSession = AVCaptureSession()
    //撮影に使うデバイス
    let videoDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    //撮影に使うオーディオデバイス
    let audioDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio)
    //ファイルのアウトプットに使う
    let fileOutput = AVCaptureMovieFileOutput()
    //撮影中かどうか
    var isRecording: Bool!
    
    override func loadView() {
        super.loadView()
        let nib = UINib(nibName: "MovieView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        isRecording = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let movieView = view as! MovieView
        movieView.recordButton.addTarget(self, action: "tapRecordButton", forControlEvents: .TouchUpInside)
        
        do {
            //動画のインプット
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            //セッションにインプットを追加
            captureSession.addInput(videoInput)
            
            //オーディオのインプット
            let audioInput = try AVCaptureDeviceInput(device: audioDevice)
            //セッションにインプットを追加
            captureSession.addInput(audioInput)
            
            //セッションにアウトプットを追加
            captureSession.addOutput(fileOutput)
            
            //カメラから取得した画像をプレビューする
            let videoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoLayer.frame = movieView.captureView.bounds
            videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            movieView.captureView.layer.addSublayer(videoLayer)
            
            //セッションを開始
            captureSession.startRunning()
        } catch let error as NSError {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapRecordButton() {
        print("tap")
        let movieView = view as! MovieView
        if !isRecording {
            let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            let documentsDirectory = path[0]
            let filePath: String = "\(documentsDirectory)/temp.mp4"
            let fileURL: NSURL = NSURL(fileURLWithPath: filePath)
            fileOutput.startRecordingToOutputFileURL(fileURL, recordingDelegate: self)
            
            //録画中にする
            isRecording = true
            
            //ボタンの画像を停止画像にする
            movieView.recordButton.setImage(UIImage(named: "ShutterButtonStop"), forState: .Normal)
            
        } else {
            //録画を停止する
            fileOutput.stopRecording()
            
            //録画中でなくする
            isRecording = false
            
            //ボタンの状態を変更する
            movieView.recordButton.setImage(UIImage(named: "ShutterButton1"), forState: .Normal)
        }
    }
    
    //撮影が停止した時に呼ぶ
    func captureOutput(captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAtURL outputFileURL: NSURL!, fromConnections connections: [AnyObject]!, error: NSError!) {
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({ () -> Void in
            let list = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Album, subtype: PHAssetCollectionSubtype.Any, options: nil)
            var assetAlbum = PHAssetCollection()
            
            list.enumerateObjectsUsingBlock { (album, index, isStop) -> Void in
                if album.localizedTitle == "video" {
                    assetAlbum = album as! PHAssetCollection
                    isStop.memory = true
                }
            }
            
            let result = PHAssetChangeRequest.creationRequestForAssetFromVideoAtFileURL(outputFileURL)
            let assetPlaceholder = result?.placeholderForCreatedAsset
            let saveAlbum = PHAssetCollectionChangeRequest(forAssetCollection: assetAlbum)
            saveAlbum?.addAssets([assetPlaceholder] as! NSFastEnumeration)
            }) { (success, error) -> Void in
                if success {
                    print("success")
                } else {
                    print(error)
                }
        }
    }
    
}
