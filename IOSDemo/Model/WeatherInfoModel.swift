//
//  WeatherInfoModel.swift
//  IOSDemo
//
//  Created by 徐良坤 on 2019/4/25.
//  Copyright © 2019 xuliangkun. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherInfoModel: NSObject {
    var city:String = ""
    var forecast: String = ""
    var fireWeatherZone: String = ""
    var forecastHourly:String = ""
    var forecastGridData: String = ""
    
    var longitude: Double = 0.0  //经度
    var latitude: Double = 0.0 //维度
    
    
    class func getModelData(json: JSON) -> WeatherInfoModel{
        let model = WeatherInfoModel.init()
        
        model.city = json["properties"]["relativeLocation"]["properties"]["city"].stringValue
        model.forecast = json["properties"]["forecast"].stringValue
        model.fireWeatherZone = json["properties"]["fireWeatherZone"].stringValue
        model.forecastHourly = json["properties"]["forecastHourly"].stringValue
        model.forecastGridData = json["properties"]["forecastGridData"].stringValue
        
        model.longitude = json["properties"]["relativeLocation"]["geometry"]["coordinates"][0].doubleValue
        model.latitude = json["properties"]["relativeLocation"]["geometry"]["coordinates"][1].doubleValue
        
        return model
        
    }

}
