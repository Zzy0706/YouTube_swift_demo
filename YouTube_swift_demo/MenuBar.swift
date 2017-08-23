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
        cv.backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let icons = ["home","trending","subscriptions","account"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(self)
        }
        let selectedIndexPath = IndexPath.init(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        cell.imageView.image = UIImage.init(named: icons[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.backgroundColor = UIColor.rgb(red: 239, green: 32, blue: 31)
        return cell
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
class MenuBarCell : BaseCell{
    let imageView : UIImageView = {
        let imageView = UIImageView.init()
        
        imageView.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        
        return imageView
    }()
    
    override var isHighlighted: Bool{//高亮
        didSet{
            
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
            
        }
    }
    
    override var isSelected: Bool{//选中
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func setupViews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 32, height: 32))
            make.center.equalTo(self)
        }
    }
}
