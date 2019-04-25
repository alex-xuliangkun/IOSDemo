//  DefineMacro.swift
//  App
//  Created by xlk on 2018/5/30.
//  Copyright © 2018年 xlk. All rights reserved.
//  宏

import Foundation
import UIKit

let PATH_OF_DOCUMENT = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]

let Screen_Scale = UIScreen.main.scale  // 屏幕分辨率
let SCREEN_WIDTH = UIScreen.main.bounds.width  //屏幕宽高
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let ISIPHONE5 = (SCREEN_WIDTH == 320.0 && SCREEN_HEIGHT == 568.0)
let ISIPHONE6 = (SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 667.0)
let ISIPHONE6p = (SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 736.0)
let ISIPHONEX = (SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 812.0)  //x  xs
let ISIPHONEXR = (SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 896.0) //xr  xsmax

let IPHONE_SCALE: Float = (ISIPHONE6p || ISIPHONEXR) ? (414.0/375.0):((ISIPHONE6||ISIPHONEX) ? 1.0:(320.0/375.0))  //手机屏宽的比例
let STATUSBAR_HEIGHT:CGFloat = (ISIPHONEX || ISIPHONEXR) ? 30:20.0       //状态栏高度 44.0 20.0 iPhoneX顶部到刘海位置的高度为30
let NavbarHeight:CGFloat = CGFloat(44.0 * IPHONE_SCALE)         //系统导航条高度
let NEWNAVHEIGHT = (STATUSBAR_HEIGHT + NavbarHeight)       // 导航栏高度(导航条和状态栏总高度)
let IPHONEX_BH:CGFloat = (ISIPHONEX || ISIPHONEXR) ? 34.0:0.0              // iPhone X底部多余的高度
let IPHONEX_TH:CGFloat = (ISIPHONEX || ISIPHONEXR) ? 24.0:0.0              // iPhone X顶部多余的高度
let TABBAR_HEIGHT:CGFloat = CGFloat(50 * IPHONE_SCALE) + IPHONEX_BH              // Tabbar高度

let countNum = 20  //请求条数

//MARK: - 版本号相关
let APP_VERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String  // App版本号
let IOS_VERSION = UIDevice.current.systemVersion._bridgeToObjectiveC().doubleValue   // 系统版本
let BUILD_VERSION = Bundle.main.infoDictionary!["CFBundleVersion"] as! String  //
let IDFV = UIDevice.current.identifierForVendor?.uuidString

let USERDEFAULTS = UserDefaults.standard
let NOTICE = NotificationCenter.default
