//
//  WeatherCell.swift
//  IOSDemo
//
//  Created by 徐良坤 on 2019/4/25.
//  Copyright © 2019 xuliangkun. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    @IBOutlet weak var weekName: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherName: UILabel!
    @IBOutlet weak var weatherDes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
