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
        
        let url = URL.init(string: "http://img2.fengniao.com/t_s700x2000/g1/M00/05/73/Cg-4q1aA3VWIQrxlAAd3Wu-O4NQAAOnGQOc8p8AB3dy182.png")
        URLSession.shared.dataTask(with: url!) { (data, res, err) in
            let v = UIImageView.init()
            v.image = UIImage.init(data: data!)
            self.view.addSubview(v)
            v.frame = CGRect.init(x: 0, y: 300, width: 375, height: 200)
            self.DataArray.append(data!)
            print(self.DataArray)
            }.resume()

        
        let scrollView = ZLScrollView.init(ds: DataArray) { (selectedIndex) in
            print("😁\(selectedIndex)")
        }
        scrollView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        self.view.addSubview(scrollView)
        print(DataArray)
        
        
        
        
        
    }

    


}

