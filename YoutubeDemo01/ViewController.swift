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
        //04-將view修改成collectionView
        collectionView?.backgroundColor = UIColor.white
        //06-新增collectionViewCell的Class
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "homeCellId")
        
    }
    
    
    //05-回傳要顯示多少item跟
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath)
             cell.backgroundColor = UIColor.red
        return cell
    }
   
    
    //08-實做sizeForItemAt 這方法
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

}

