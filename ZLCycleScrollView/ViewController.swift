//
//  ViewController.swift
//  ZLCycleScrollView
//
//  Created by Nicholas Lee on 2017/1/12.
//  Copyright © 2017年 NickLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let path = Bundle.main.path(forResource: "01.jpg", ofType: nil)
    var DataArray: [String] = ["01.jpg", "02.jpg", "03.jpg", "04.jpg"]
    var DA2 = ["http://ccm.ddcdn.com/ext/photo-s/02/2f/e8/a0/tahiti-iti-from-the-beach.jpg", "http://www.mszaojiao.com/uploadfile/20140401/20140401120601315.jpg", "http://img2.zol.com.cn/product/106_940x705/212/cesp7cPtuBZ1M.jpg", "http://dimg02.c-ctrip.com/images/fd/tg/g3/M0B/83/4A/CggYGlX6EE2AQnKJAANcMbtViLs851_R_1024_10000.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = ZLScrollView.init(ds: DA2) { (selectedIndex) in
            print("😁\(selectedIndex)")
        }
        scrollView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        self.view.addSubview(scrollView)
    }

    

}
