//
//  ZLScrollView.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 Nicholas Lee. All rights reserved.
//

import UIKit

class ZLScrollView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {

    var dataS = [Data]()
    let pc = UIPageControl()
    let didSelectCallBack: (NSInteger) -> Void
    
    init(ds: [Data], didSelect:@escaping (NSInteger) -> Void) {
        self.didSelectCallBack = didSelect
        super.init(frame: .zero, collectionViewLayout: ZLScrollViewFlowLayout())
        self.dataS = ds
        self.delegate = self
        self.dataSource = self
        self.register(ZLScrollViewCell.self, forCellWithReuseIdentifier: "cell")
        
        pc.numberOfPages = dataS.count
        self.pc.currentPage = 0
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        pc.sizeToFit()
        
        DispatchQueue.main.async {
            self.superview?.addSubview(self.pc)
            self.pc.frame = CGRect.init(x: self.bounds.size.width - self.pc.bounds.size.width, y: self.bounds.size.height - (self.pc.bounds.size.height), width: self.pc.bounds.size.width, height: self.pc.bounds.size.height)

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
        cell.data = self.dataS[indexPath.item % self.dataS.count]
        return cell
    }
    
//  MARK:- CollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectCallBack(indexPath.item % self.dataS.count)
    }
    
//  MARK:- ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.x)
        
        let i = NSInteger(scrollView.contentOffset.x / self.bounds.size.width) % self.dataS.count
        print(i)
        
        
        
        self.pc.currentPage = i
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.bounds.size.width as NSNumber
        if index == 0 || index == (self.numberOfItems(inSection: 0) - 1) as NSNumber {
            let r = self.dataS.count - (index == 0 ? 0 : 1)
            scrollView.contentOffset = CGPoint.init(x: CGFloat(r) * scrollView.bounds.size.width, y: 0)
        }
    }
}
