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
    
    var videos : [Video]?
    
    func fetchVideos(){
        let url = URL.init(string: "https://raw.githubusercontent.com/liuyandong/youtube/master/home.json")
        URLSession.shared.dataTask(with: url!) { (Data, URLResponse, Error) in
            if Error != nil{
                print(Error!)
                return
            }
            do{
                
                let json = try JSONSerialization.jsonObject(with: Data!, options: .mutableContainers)
                self.videos = [Video]()
                
                for dictionary in json as! [[String : AnyObject]]{
                    let video = Video()
                    print(dictionary)
                    video.title = dictionary["title"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    let channelDic = dictionary["channel"] as! [String : AnyObject]
                    let channel = Channel()
                    channel.name = channelDic["name"] as? String
                    channel.profileImageName = channelDic["profile_image_name"] as? String
                    video.channel = channel
                    self.videos?.append(video)
                }
                print(self.videos!)
                DispatchQueue.main.async {
                    self.collectionview.reloadData()
                }
                
            }
            catch let jsonError{
                print(jsonError)
            }
           
            
        }.resume()
    }
    var collectionview :UICollectionView!
   
    
    //    var videos : [Video] = {
    //        var westlifeChannel = Channel()
    //        westlifeChannel.name = "linkinParkNumb"
    //        westlifeChannel.profileImageName = "linkinpark"
    //
    //        var westlifeChannel2 = Channel()
    //        westlifeChannel2.name = "lizhiReHe"
    //        westlifeChannel2.profileImageName = "lizhi"
    //
    //        var westlifeChannel3 = Channel()
    //        westlifeChannel3.name = "lizhiShanYinLu"
    //        westlifeChannel3.profileImageName = "lizhi"
    //
    //        var westlifeChannel4 = Channel()
    //        westlifeChannel4.name = "youRaiseMeUp"
    //        westlifeChannel4.profileImageName = "westlife"
    //
    //        var youRaiseMeUpVideo = Video()
    //        youRaiseMeUpVideo.thumbnailImageName = "linkinParkNumb"
    //        youRaiseMeUpVideo.tille = "DG-1111111111"
    //        youRaiseMeUpVideo.channel = westlifeChannel;
    //        youRaiseMeUpVideo.numberOfViews = 1008610010
    //
    //        var youRaiseMeUpVideo2 = Video()
    //        youRaiseMeUpVideo2.thumbnailImageName = "lizhiReHe"
    //        youRaiseMeUpVideo2.tille = "DG-2222222222"
    //        youRaiseMeUpVideo2.channel = westlifeChannel2;
    //         youRaiseMeUpVideo2.numberOfViews = 1008610010
    //        var youRaiseMeUpVideo3 = Video()
    //        youRaiseMeUpVideo3.thumbnailImageName = "lizhiShanYinLu"
    //        youRaiseMeUpVideo3.tille = "DG-3333333333"
    //        youRaiseMeUpVideo3.channel = westlifeChannel3;
    //         youRaiseMeUpVideo3.numberOfViews = 1008610010
    //
    //        var youRaiseMeUpVideo4 = Video()
    //        youRaiseMeUpVideo4.thumbnailImageName = "youRaiseMeUp"
    //        youRaiseMeUpVideo4.tille = "DG-4444444444"
    //        youRaiseMeUpVideo4.channel = westlifeChannel4;
    //         youRaiseMeUpVideo4.numberOfViews = 1008610010
    //        return [youRaiseMeUpVideo,youRaiseMeUpVideo2,youRaiseMeUpVideo3,youRaiseMeUpVideo4]
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        creatHomeLabel()
        setUpNavBarButtons()
       
        self.navigationController!.navigationBar.isTranslucent = false
        creatCollectionview()
        fetchVideos()
        collectionview.backgroundColor = UIColor.white
        //下移collectionview
        collectionview.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionview.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
         setMenuBar()
    }
    //自定义navigationItem title
    func creatHomeLabel(){
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width-30, height: 50))

        titleLabel.text = "YouTube"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    func setUpNavBarButtons(){
        let searchImage = UIImage.init(named: "搜索2")
        let searchBarButtonItem = UIBarButtonItem.init(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
         searchBarButtonItem.tintColor = UIColor.white
        let moreBarButtonItem = UIBarButtonItem.init(image:UIImage.init(named: "更多"),style: .plain, target: self, action:#selector(handleMore))
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

        return videos?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "homeCellId", for: indexPath) as! YoutubeCell
        cell.video = videos?[indexPath.row]
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
extension UIImage {
    /**
     *  重设图片大小
     */
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        self.draw(in: CGRect.init(x: 0, y: 0, width: reSize.width, height: reSize.height));
        
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
    /**
     *  等比率缩放
     */
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize.init(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
    
        return reSizeImage(reSize: reSize)
    }
}
