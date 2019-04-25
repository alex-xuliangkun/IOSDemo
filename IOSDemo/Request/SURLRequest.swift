//  SURLRequest.swift
//  TestAlamofire
//  Created by DS on 2017/7/12.
//  Copyright © 2017年 First Cloud. All rights reserved.
/*
 网络请求(基于Alamofire框架)
 */

import UIKit
import Alamofire

typealias ResponseSuccess = (_ data:Any)->() // 请求成功回调
typealias ResponseError = (_ error:Error)->() // 请求出错回调
typealias ResponseProgress = (_ pro: CGFloat)->()  //进度回调

class SURLRequest: NSObject {
    
    // 单例
    class var sharedInstance: SURLRequest {
        struct instance {
            static let _instance:SURLRequest = SURLRequest()
        }
        return instance._instance
    }
    
    /// Create a get request
    /// - Parameters:
    ///   - url: the request url
    ///   - suc: request success callback
    ///   - err: request error callback
    func requestGetWithUrl(_ url: String ,
                           suc: @escaping ResponseSuccess ,
                           err: @escaping ResponseError) {
        let urlStr: String = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        Alamofire.request(urlStr)
            .responseJSON {response in
                switch response.result{
                case .success(let value):
                        suc(value)
                case .failure(let error):
                    err(error)
                }
        }
    }

    /// Create a post request
    /// - Parameters:
    ///   - url: the post request url
    ///   - param: the request parameters
    ///   - suc: request success callback
    ///   - err: request error callback
    func requestPostWithUrl(_ url :String ,
                            param :[String: Any]?,
                            suc :@escaping ResponseSuccess ,
                            err :@escaping ResponseError) {
        let urlStr: String = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        Alamofire.request(urlStr, method: .post, parameters: param).responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                suc(value)
            case .failure(let error):
                err(error)
            }
        }
    }
    
}
