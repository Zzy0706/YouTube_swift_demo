//
//  Video.swift
//  YouTube_swift_demo
//
//  Created by Eren.Zhang on 2017/8/23.
//  Copyright © 2017年 com.zzy0706.io. All rights reserved.
//

import UIKit

class Video: NSObject {
    var title : String?
    var thumbnailImageName : String?
    var numberOfViews : NSNumber?
    var channel : Channel?
}
class Channel: NSObject {
    var name : String?
    var profileImageName : String?
}
