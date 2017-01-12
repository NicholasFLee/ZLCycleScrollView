//
//  ZLScrollViewFlowLayout.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 Nicholas Lee. All rights reserved.
//

import UIKit

class ZLScrollViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        self.itemSize = (self.collectionView?.bounds.size)!
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.scrollDirection = .horizontal
        
        self.collectionView?.bounces = false
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.showsHorizontalScrollIndicator = false
    }
    
    
    
}
