//
//  MenuBar.swift
//  YoutubeDemo01
//
//  Created by SUNG HAO LIN on 2017/5/6.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit
//50-建立MenuBar
//56-增加協定collection相關
class MenuBar: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //54-建立collectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //63-將cv背景加入顏色
        cv.backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        //56
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    //58-cellID
    let cellId = "cellID"
    //64-將icon設成陣列
    let icons = ["Home", "Fire02", "data", "User"]
    
    
    //57-實做collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        //65-顯示icons
        //66-加上.withRenderingMode(.alwaysTemplate)，沒點到會變藍色
        cell.imageView.image = UIImage(named: icons[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        return cell
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //59-註冊cell
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        
        backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        
        //55-加上collectionView
        addSubview(collectionView)
        addconstraintsWithVisualFormat(format: "H:|[v0]|", views: collectionView)
        addconstraintsWithVisualFormat(format: "V:|[v0]|", views: collectionView)
        
        //70-設置一開始就默認首頁icon
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //
}

//61-建立menubarcell

class MenuBarCell:BaseCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Home")
        //67-再變成暗色
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return iv
    }()

    //68-選到會變色不然就是暗紅色，放開就恢復
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    //69-點選到會一直是白色
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    
    override func setupViews() {
        addSubview(imageView)
        addconstraintsWithVisualFormat(format: "H:[v0(30)]", views: imageView)
        addconstraintsWithVisualFormat(format: "V:[v0(30)]", views: imageView)
        
        //62-將圖片置中
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    
    
}






