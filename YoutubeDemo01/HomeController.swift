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
class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        //42-將navigationBar改成不透明
        self.navigationController!.navigationBar.isTranslucent = false
        //44-顯示label"Home"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 30, height: view.frame.height))
        titleLabel.text = "首頁"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        //09-navigation加上title
        //43-取消title
        //navigationItem.title = "Home"
        //04-將view修改成collectionView
        collectionView?.backgroundColor = UIColor.white
        //06-新增collectionViewCell的Class
        //10-將class修改成YouTubeVideoCell
        collectionView?.register(YouTubeVideoCell.self, forCellWithReuseIdentifier: "homeCellId")
        
        //45-建立navigationButton 函式
        setupNavBarButtons()
        
    }
    //45-建立navigationButton 函式
    func setupNavBarButtons() {
        //47-增加.withRenderingMode(.alwaysOriginal) <= 修改icon顏色
        let searchImage = UIImage(named: "search01")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        //48-建立more
        let moreButtonImage = UIImage(named: "more02")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonItem = UIBarButtonItem(image: moreButtonImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem,searchBarButtonItem]
    }
    
    //46-建立handleSearch函式
    func handleSearch() {
        print("search something")
    }
    
    //49-建立handleMore函式
    func handleMore() {
        print("MoreMoreMore")
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
        //40-計算高度-尺寸16：9為最佳
        let height = (view.frame.width - 20) * 9/16
        return CGSize(width: view.frame.width, height: height + 90 )
    }
    
    
    //16-將item與item之間的間距設為0，如此才能讓四週間距相等
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
        
    
    
    
//
}





