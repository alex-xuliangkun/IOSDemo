//  FuncMacro.swift
//  App
//  Created by xlk on 2018/5/30.
//  Copyright © 2018年 xlk. All rights reserved.

import UIKit

// MARK: - 系统相关
func ISIPHONE() -> Bool {
    #if TARGET_IPHONE_SIMULATOR
        return false
    #else
        return true
    #endif
} //是否是真机

// MARK: - 颜色相关
func RGB(h:Int,alpha:CGFloat) ->UIColor {
    return RGBCOLOR(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF),alpha: alpha)
} //根据十六进制数生成颜色 HEXCOLOR(h:0xe6e6e6,alpha:0.8)
func RGBCOLOR(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
} //根据R,G,B生成颜色
func RANDOMCOLOR() -> UIColor {
    return RGBCOLOR(r: CGFloat(arc4random()%256), g: CGFloat(arc4random()%256), b: CGFloat(arc4random()%256),alpha: 1)
} //随机色

func pingfangRegularFontStyle(size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Regular", size: size * CGFloat(IPHONE_SCALE))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(IPHONE_SCALE))
    }
}

//MARK: - DEBUG模式下打印(Swift)
func Dprint<T>(_ message: T, filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
    let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    
    let dformatter = DateFormatter.init()
    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
    let str = dformatter.string(from: Date.init())
    
    print("class:" + fileName + "  time:" + "\(str)" + " line:" + "\(rowCount)" + "  \(message)" + "\n")
    #endif
}

extension String{
    //   取子字符串
    //   - Parameters:
    //   - startIndex: 开始位置索引
    //   - endIndex: 结束位置索引
    //   - Returns: 从开始位置到结束位置的前一个位置上的字符串
    func substring(startIndex:Int, endIndex:Int) -> String {
        let start = self.index(self.startIndex, offsetBy: startIndex)  //索引从开始偏移startIndex个位置
        let end = self.index(self.startIndex, offsetBy: endIndex)  //索引从开始偏移endIndex个位置
        return String(self[start..<end])
    }
}
