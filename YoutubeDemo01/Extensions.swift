//
//  Extensions.swift
//  YoutubeDemo01
//
//  Created by SUNG HAO LIN on 2017/5/5.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit

//21-擴展
//40-將extension搬到這
//UIView...<- 點點點 意思就是不只傳入一個參數
extension UIView {
    func addconstraintsWithVisualFormat(format: String, views: UIView...) {
        
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            //25-從上面搬下來
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        //22-將上面func拉下來修改使用-修改Format 跟 viewsDict 參數
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}



extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


