//
//  ZLScrollViewCell.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 Nicholas Lee. All rights reserved.
//

import UIKit

class ZLScrollViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    var url: URL? = nil {
        didSet{
            let data = try! Data.init(contentsOf: url!)
            imageView.image = UIImage.init(data: data)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView.init(frame: self.bounds)
        self.contentView.addSubview(imageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
