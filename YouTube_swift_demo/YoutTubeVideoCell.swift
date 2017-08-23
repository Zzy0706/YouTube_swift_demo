//
//  YoutTubeVideoCell.swift
//  YouTube_swift_demo
//
//  Created by Eren.Zhang on 2017/8/7.
//  Copyright © 2017年 com.zzy0706.io. All rights reserved.
//

import UIKit
class BaseCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
class YoutubeCell : BaseCell{
        var video : Video?{
            didSet{
                
                titleLabel.text = video?.title
                setupThumbnailImage()
                setupProfileImage()
                if let profileImageName = video?.channel?.profileImageName {
                    userImageIco.image = UIImage.init(named: profileImageName)
                }
                if let channelName  = video?.channel?.name,let numberOfViews = video?.numberOfViews{
                    let formatter = NumberFormatter.init()
                    formatter.numberStyle = .decimal
                    sometextView.text = "\(channelName) * \( formatter.string(from: numberOfViews)!) 次观看"
                }
                
            }
        }
    
    func setupThumbnailImage(){
        if let thumbnailUrl = video?.thumbnailImageName{
            videoThumbnailView.loadImage(urlString: thumbnailUrl)
        }
    }
    func setupProfileImage(){
        if let profileImageUrl = video?.channel?.profileImageName{
            userImageIco.loadImage(urlString: profileImageUrl)
        }
        
    }
        let videoThumbnailView: CustomImageView = {
        let imageView = CustomImageView.init()
        imageView.image = UIImage.init(named: "01")
        imageView.contentMode = .scaleAspectFill//显示image的实际大小
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let blackView : UIView = {
        let blackView = UIView.init()
        blackView.backgroundColor = UIColor.black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        return blackView
    }()
    let userImageIco : CustomImageView = {
        let userimageView = CustomImageView.init()
        userimageView.image = UIImage.init(named: "01")
        userimageView.layer.cornerRadius = 22 //半斤为22的圆
        userimageView.layer.masksToBounds = true
        userimageView.backgroundColor = UIColor.blue
        return userimageView
    }()
    let titleLabel : UILabel = {
        let titleLabel = UILabel.init()
        titleLabel.text = "Best Day Of My Life - American Authors"
        titleLabel.adjustsFontSizeToFitWidth = true //自适应字体大小
        //titleLabel.backgroundColor = UIColor.cyan
        return titleLabel
    }()
    let sometextView : UITextView = {
        let sometextView = UITextView.init()
        //sometextView.text = "6666666666666"
        sometextView.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        //sometextView.backgroundColor = UIColor.brown
        sometextView.adjustsFontForContentSizeCategory = true
        sometextView.isUserInteractionEnabled = false
        return sometextView
    }()
  override  func setupViews(){
        //todo:addSubview
        //backgroundColor = UIColor.white
        //videoThumbnailView.backgroundColor = UIColor.green
        addSubview(videoThumbnailView)
        addSubview(blackView)
        addSubview(userImageIco)
        addSubview(titleLabel)
        addSubview(sometextView)
        videoThumbnailView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(10, 15, 80, 15))
        }
        blackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(0)
            make.size.equalTo(CGSize.init(width: self.frame.width, height: 1))
        }
        userImageIco.snp.makeConstraints { (make) in
            make.top.equalTo(videoThumbnailView.snp.bottom).offset(10)
            make.left.equalTo(self).offset(15)
            make.size.equalTo(CGSize.init(width: 44, height: 44))
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(videoThumbnailView.snp.bottom).offset(9)
            make.left.equalTo(userImageIco.snp.right).offset(10)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(20)
        }
        sometextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.left.equalTo(userImageIco.snp.right).offset(10)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(20)
        }
    }
    
}
