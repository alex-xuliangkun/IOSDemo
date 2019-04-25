//  WeekInfoModel.swift
//  IOSDemo
//
//  Created by 徐良坤 on 2019/4/25.
//  Copyright © 2019 xuliangkun. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeekInfoModel: NSObject {
    
    var shortForecast:String = ""
    var icon: String = ""
    var temperature: Int = 0
    var startTime:String = ""
    
    class func getModelData(json: JSON) -> WeekInfoModel{
        let model = WeekInfoModel.init()
        
        model.shortForecast = json["shortForecast"].stringValue
        model.icon = json["icon"].stringValue
        model.temperature = json["temperature"].intValue
        let time: String = json["startTime"].stringValue
        model.startTime = time.substring(startIndex: 0, endIndex: 16)
        
        return model
        
    }

}
