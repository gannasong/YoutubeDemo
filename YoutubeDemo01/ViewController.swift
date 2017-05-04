//
//  ViewController.swift
//  YoutubeDemo01
//
//  Created by SUNG HAO LIN on 2017/5/4.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit
    //02-直接修改繼承的項目，改為collectionview，然後跳到appDepegate去加layout
    //07-增加UICollectionViewDelegateFlowLayout
class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        //09-navigation加上title
        navigationItem.title = "Home"
        
        //04-將view修改成collectionView
        collectionView?.backgroundColor = UIColor.white
        //06-新增collectionViewCell的Class
        //10-將class修改成YouTubeVideoCell
        collectionView?.register(YouTubeVideoCell.self, forCellWithReuseIdentifier: "homeCellId")
        
    }
    
    
    //05-回傳要顯示多少item跟
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath)
        return cell
    }
   
    
    //08-實做 sizeForItemAt 這個方法
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    //16-將item與item之間的間距設為0，如此才能讓四週間距相等
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //11-新增自定義 collection class
    class YouTubeVideoCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpViews()
        }
        
        //13-建立imageView
        let videoThumbnailView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false //15-增加這項
            return imageView
        }()
        
        //17-item與item之間的view-黑線
        let separatorView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.black
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        
        //12-建立 setupViews func
        //14-加進videoThumbnailView
        func setUpViews() {
            addSubview(videoThumbnailView)
            //18-新增view
            addSubview(separatorView)
            //videoThumbnailView.frame = CGRect(x: 0, y: 0, width: 200, height: 100) //設置尺寸大小
            
            //15-設置item位置(可以寫成一個函式)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : videoThumbnailView]))
            //15-設置item位置
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : videoThumbnailView]))
            
            //19-分隔黑線的位置
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorView]))
            //19-分隔黑線的位置(H跟V都要打才會有用)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorView]))

            videoThumbnailView.backgroundColor = UIColor.green  //設置顏色
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    
    
    
    
    
    
//
}

