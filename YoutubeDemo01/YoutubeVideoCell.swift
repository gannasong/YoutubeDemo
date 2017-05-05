//
//  YoutubeVideoCell.swift
//  YoutubeDemo01
//
//  Created by SUNG HAO LIN on 2017/5/5.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit
//52-將cell內容搬到這裡

//11-新增自定義 collection class
class YouTubeVideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    //13-建立imageView
    let videoThumbnailView: UIImageView = {
        let imageView = UIImageView()
        //imageView.translatesAutoresizingMaskIntoConstraints = false //15-增加這項//24搬到下面或刪掉
        imageView.backgroundColor = UIColor.green
        //34-新增照片
        imageView.image = UIImage(named: "image01")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //24-建立頭像image
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        //33-新增照片
        imageView.image = UIImage(named: "myImage")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.clipsToBounds = true
        //imageView.layer.masksToBounds = true
        return imageView
    }()
    
    //27-建立label
    let titleLabel: UILabel = {
        let label = UILabel()
        //36-註銷label背景色
        //label.backgroundColor = UIColor.orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Maroon 5 - Sugar"
        return label
    }()
    
    //30-建立textfield
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = UIColor.cyan
        textView.translatesAutoresizingMaskIntoConstraints = false
        //35-設定textfield不能點選使用
        textView.isUserInteractionEnabled = false
        //37-增加textfield文字(原點是按住option+8)，註銷上面背景色
        textView.text = "Maroon5VEVO • 觀看次數：1,973,045,993"
        //38-修正textfield字體位置
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        //39-將字體變成灰色
        textView.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return textView
    }()
    
    
    
    //17-item與item之間的view-黑線
    let separatorView: UIView = {
        let view = UIView()
        //39-將字體變成灰色
        view.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return view
    }()
    
    
    //12-建立 setupViews func
    //14-加進videoThumbnailView
    func setUpViews() {
        addSubview(videoThumbnailView)
        //18-新增view
        addSubview(separatorView)
        //25-新增userView
        addSubview(userImageView)
        //28-新增label
        addSubview(titleLabel)
        //31-新增textField
        addSubview(subtitleTextView)
        
        
        //videoThumbnailView.frame = CGRect(x: 0, y: 0, width: 200, height: 100) //設置尺寸大小
        //15-設置item位置(可以寫成一個函式)
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : videoThumbnailView]))
        //15-設置item位置
        //20-簡化條件設置，要對照一下下面的扣
        //            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0]-10-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : videoThumbnailView, "v1" : separatorView]))
        
        //23-使用剛剛的func來完成配置
        addconstraintsWithVisualFormat(format: "H:|-10-[v0]-10-|", views: videoThumbnailView)
        addconstraintsWithVisualFormat(format: "V:|-10-[v0]-8-[v1(44)]-16-[v2(1)]|", views: videoThumbnailView, userImageView, separatorView)
        addconstraintsWithVisualFormat(format: "H:|[v0]|", views: separatorView)
        
        //26-新增userImage條將
        addconstraintsWithVisualFormat(format: "H:|-10-[v0(44)]", views: userImageView)
        
        //29-設置label位置
        //top
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: videoThumbnailView, attribute: .bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self , attribute: .height, multiplier: 0, constant: 20))
        
        //32-textField設置
        //top
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 0))
        //height
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self , attribute: .height, multiplier: 0, constant: 20))
        
        
        //19-分隔黑線的位置
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorView]))
        //19-分隔黑線的位置(H跟V都要打才會有用)
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : separatorView]))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
