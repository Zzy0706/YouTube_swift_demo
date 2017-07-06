//
//  ViewController.swift
//  YouTube_swift_demo
//
//  Created by Eren.Zhang on 2017/7/4.
//  Copyright © 2017年 com.zzy0706.io. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var collectionview :UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatHomeLabel()
        self.navigationController!.navigationBar.isTranslucent = false
        creatCollectionview()
        collectionview.backgroundColor = UIColor.white
    }
    //自定义navigationItem title
    func creatHomeLabel(){
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width-30, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    
    //MARK:UICollectionView创建
    func creatCollectionview(){
    let r = UIScreen.main.bounds
    let layout = UICollectionViewFlowLayout.init()
      collectionview = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: r.size.width, height: r.size.height), collectionViewLayout:layout)
      collectionview.delegate = self
      collectionview.dataSource = self
      collectionview.register(YoutubeCell.self, forCellWithReuseIdentifier: "homeCellId")
    self.view.addSubview(collectionview)
    }
    //MARK:UICollectionView协议
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath)
        //cell.backgroundColor = UIColor.red
        return cell
    }
    
    //MARK:UICollectionViewLayout协议
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height = (view.frame.width - 30)
        return CGSize.init(width: view.frame.width, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK:自定义Cell
    class YoutubeCell : UICollectionViewCell{
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpViews()
            
        }
        let videoThumbnailView: UIImageView = {
            let imageView = UIImageView.init()
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
        let userImageIco : UIImageView = {
           let userimageView = UIImageView.init()
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
            sometextView.text = "6666666666666"
            sometextView.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
            //sometextView.backgroundColor = UIColor.brown
            sometextView.adjustsFontForContentSizeCategory = true
            sometextView.isUserInteractionEnabled = false
            return sometextView
        }()
        func setUpViews(){
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
                make.top.equalTo(videoThumbnailView.snp.bottom).offset(5)
                make.left.equalTo(self).offset(15)
                make.size.equalTo(CGSize.init(width: 44, height: 44))
            }
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(videoThumbnailView.snp.bottom).offset(5)
                make.left.equalTo(userImageIco.snp.right).offset(10)
                make.right.equalTo(self).offset(-15)
                make.height.equalTo(20)
            }
            sometextView.snp.makeConstraints { (make) in
                make.top.equalTo(titleLabel.snp.bottom).offset(5)
                make.left.equalTo(userImageIco.snp.right).offset(10)
                make.right.equalTo(self).offset(-15)
                make.height.equalTo(20)
            }
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

