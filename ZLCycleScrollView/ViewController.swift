//
//  ViewController.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 NickLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var DataArray: [Data] = {
        let urls = Bundle.main.urls(forResourcesWithExtension: ".jpg", subdirectory: "images")
        var resArray = [Data]()
        for url in urls! {
            let data = try! Data.init(contentsOf: url)
            resArray.append(data)
        }
        
        
        return resArray
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let scrollView = ZLScrollView.init(ds: DataArray) { (selectedIndex) in
            print("😁\(selectedIndex)")
        }
        scrollView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        self.view.addSubview(scrollView)
//        print(DataArray)
        
        
        
        
        
    }

    


}

