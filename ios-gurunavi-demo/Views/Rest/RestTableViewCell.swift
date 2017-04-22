//
//  RestTableViewCell.swift
//  ios-gurunavi-demo
//
//  Created by Eiji Kushida on 2017/03/17.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Kingfisher
import UIKit

final class RestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    
    var item: Rest? {
        
        didSet {
            
            if let item = self.item {
                                
                _ = self.thumnailImageView.kf
                    .setImage(with: URL(string: item.imageUrl),
                              placeholder: nil,
                              options: [.transition(ImageTransition.fade(1)),
                                        .keepCurrentImageWhileLoading],
                              progressBlock:nil,
                              completionHandler: { [weak self] image, _, _, _ in
                                                
                                self?.thumnailImageView.image = image
                })
                
                self.storeNameLabel.text = item.name
                self.stationNameLabel.text =
                    String(format: "WALK_TIME".localized(),
                           item.station, item.walk)
                self.addressLabel.text = item.address
                self.telLabel.text = item.tel
                
                if let budet = Int(item.budget) {
                    self.budgetLabel.text = "¥\(budet.decimalStr)"
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumnailImageView.image = nil
    }
}
