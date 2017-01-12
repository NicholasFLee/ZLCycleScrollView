//
//  ZLScrollView.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 Nicholas Lee. All rights reserved.
//

import UIKit

class ZLScrollView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    var dataS = [URL]()
    let didSelectCallBack: (NSInteger) -> Void
    
    init(urls: [URL], didSelect:@escaping (NSInteger) -> Void) {
        self.didSelectCallBack = didSelect
        super.init(frame: .zero, collectionViewLayout: ZLScrollViewFlowLayout())
        self.dataS = urls
        self.delegate = self
        self.dataSource = self
        self.register(ZLScrollViewCell.self, forCellWithReuseIdentifier: "cell")
        
        DispatchQueue.main.async {
            if self.dataS.count > 1 {
                let indexPath = IndexPath.init(item: self.dataS.count, section: 0)
                self.scrollToItem(at: indexPath, at: .left, animated: false)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//  MARK:- CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let r = self.dataS.count == 1 ? 1 : 100
        return self.dataS.count * r
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ZLScrollViewCell
        cell.url = self.dataS[indexPath.item % self.dataS.count]
        return cell
    }
    
//  MARK:- CollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectCallBack(indexPath.item % self.dataS.count)
    }
    
//  MARK:- ScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.bounds.size.width as NSNumber
        if index == 0 || index == (self.numberOfItems(inSection: 0) - 1) as NSNumber {
            let r = self.dataS.count - (index == 0 ? 0 : 1)
            scrollView.contentOffset = CGPoint.init(x: CGFloat(r) * scrollView.bounds.size.width, y: 0)
        }
    }
}
