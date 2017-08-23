//
//  Extensions.swift
//  YouTube_swift_demo
//
//  Created by Eren.Zhang on 2017/7/6.
//  Copyright © 2017年 com.zzy0706.io. All rights reserved.
//

import UIKit
extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
let imageCache = NSCache<NSString,UIImage>()

class CustomImageView:UIImageView{
    var originalUrlString : String?
    
    
    func loadImage(urlString : String){
        originalUrlString = urlString
        
        let url = URL.init(string: urlString)
        image = nil;
        if let imageFromCache = imageCache.object(forKey: urlString as NSString ){
            self.image = imageFromCache
            
        }
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respon, error) in
                if error != nil{
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    let imageToCache = UIImage.init(data: data!)
                    
                    if(self.originalUrlString == urlString){
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                    

                }
        }).resume()
        
    }
}
