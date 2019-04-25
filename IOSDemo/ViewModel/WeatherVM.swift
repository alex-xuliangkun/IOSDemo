//  WeatherVM.swift
//  IOSDemo
//  Created by 徐良坤 on 2019/4/25.
//  Copyright © 2019 xuliangkun. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherVM: NSObject {
    
   class func getWeatherInfoRequest(point:String, suc:@escaping (_ result:WeatherInfoModel)->()){
        let url = String.init(format: WEATHERINFOURL, point)
        SURLRequest.sharedInstance.requestGetWithUrl(url, suc: { (data) in
            let resultV = JSON(data)
            
            let model = WeatherInfoModel.getModelData(json: resultV)
            Dprint(resultV)
            suc(model)

        }) { (errror) in

        }
    }
    
    class func getWeekWeatherInfoRequest(url:String, suc:@escaping (_ result:[WeekInfoModel])->()){
        SURLRequest.sharedInstance.requestGetWithUrl(url, suc: { (data) in
            let resultV = JSON(data)
            Dprint(resultV)
            var arr: [WeekInfoModel] = []
            let value = resultV["properties"]["periods"].arrayValue
            for obj in value{
                let model = WeekInfoModel.getModelData(json: obj)
                arr.append(model)
            }
            suc(arr)
            
            
            
        }) { (errror) in
            
        }
    }
    
    

}
