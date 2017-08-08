//
//  MenuBar.swift
//  YouTube_swift_demo
//
//  Created by Eren.Zhang on 2017/8/7.
//  Copyright © 2017年 com.zzy0706.io. All rights reserved.
//

import UIKit

class MenuBar : UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

   lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout : layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.black
        return cell
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
