//
//  ZLScrollViewCell.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 Nicholas Lee. All rights reserved.
//

import UIKit
import Kingfisher

class ZLScrollViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    var data: String? = nil {
        didSet{
            if !(data?.contains("http://"))! || (data?.contains("https://"))! {
                imageView.image = UIImage.init(named: data!)
            } else {
                imageView.kf.setImage(with: URL.init(string: data!))
            }
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
