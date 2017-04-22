//
//  RestTableFooter.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class RestTableFooter: UIView {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    /// インジケーターのアニメーションを開始する
    func start() {
        indicator.startAnimating()
    }
        
    /// インジケーターのアニメーションを停止する
    func stop() {
        
        if indicator.isAnimating {
            indicator.stopAnimating()
        }
    }
}
