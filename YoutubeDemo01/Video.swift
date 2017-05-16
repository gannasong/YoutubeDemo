//
//  Video.swift
//  YoutubeDemo01
//
//  Created by SUNG HAO LIN on 2017/5/8.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit
//70
class Video: NSObject {
    var title: String?
    var thumbnailImageName: String?
    var numberOfViews: NSNumber?
    var channel:Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
