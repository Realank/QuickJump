//
//  ViewController.swift
//  QuickJump
//
//  Created by Realank-Mac on 16/1/21.
//  Copyright © 2016年 Realank-Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let appDict = ["weixin":"微信","instagram":"Instagram","mqq":"QQ","taobao":"淘宝","alipay":"支付宝","sinaweibo":"微博","youku":"优酷","imeituan":"美团","wccbyihaodian":"一号店","zhihu":"知乎","dianping":"大众点评","doubanradio":"豆瓣FM","ibooks":"iBooks","uber":"Uber"]
    var installedAppList : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let canOpenApp = UIApplication.sharedApplication().canOpenURL(NSURL(string: "weixin://")!)
//        print(canOpenApp)
//        UIApplication.sharedApplication().openURL(NSURL(string: "weixin://")!)
        
        for appName in appDict.keys {
            let url = NSURL(string: "\(appName)://")
            if let appUrl = url {
                if UIApplication.sharedApplication().canOpenURL(appUrl) {
                    installedAppList .append(appName)
                }
            }
        }
        
        print(installedAppList)
        
        self.collectionView.registerNib(UINib(nibName: "IconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "iconCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
////        UIApplication.sharedApplication().openURL(NSURL(string: "sinaweibo://")!)
//        collectionView.reloadData()
//    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return installedAppList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let appScheme = installedAppList[index]
        let appName = appDict[appScheme]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("iconCell", forIndexPath: indexPath)
        if let iconCell = cell as? IconCollectionViewCell {
            iconCell.name = appName!
            iconCell.scheme = appScheme
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView .deselectItemAtIndexPath(indexPath, animated: true)
        let index = indexPath.row
        let appScheme = installedAppList[index]
        
        
        UIApplication.sharedApplication().openURL(NSURL(string: "\(appScheme)://")!)
        
    }


}

