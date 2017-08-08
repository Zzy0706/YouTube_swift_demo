//
//  ViewController.swift
//  YouTube_swift_demo
//
//  Created by Eren.Zhang on 2017/7/4.
//  Copyright © 2017年 com.zzy0706.io. All rights reserved.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var collectionview :UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatHomeLabel()
        setUpNavBarButtons()
       
        self.navigationController!.navigationBar.isTranslucent = false
        creatCollectionview()
        collectionview.backgroundColor = UIColor.white
        //下移collectionview
        collectionview.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionview.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
         setMenuBar()
    }
    //自定义navigationItem title
    func creatHomeLabel(){
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width-30, height: view.frame.height))

        titleLabel.text = "YouTube"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    func setUpNavBarButtons(){
        let searchBarButtonItem = UIBarButtonItem.init(title: "搜索", style: .plain, target: self, action:#selector(handleSearch))
         searchBarButtonItem.tintColor = UIColor.white
        let moreBarButtonItem = UIBarButtonItem.init(title: "更多", style: .plain, target: self, action:#selector(handleMore))
        searchBarButtonItem.tintColor = UIColor.white
        moreBarButtonItem.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [moreBarButtonItem,searchBarButtonItem]
        //let searchImage = UIImage.init()
    }
    func handleSearch(){
        print("Search")
    }
    func handleMore(){
        print("More")
    }
    let menuBar : MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    func setMenuBar(){
        
        view.addSubview(menuBar)
        menuBar.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.size.equalTo(CGSize.init(width: view.frame.width, height: 50))
        }
    }
    //MARK:UICollectionView创建
    func creatCollectionview(){
    let r = UIScreen.main.bounds
    let layout = UICollectionViewFlowLayout.init()
      collectionview = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: r.size.width, height: r.size.height-64), collectionViewLayout:layout)
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
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

