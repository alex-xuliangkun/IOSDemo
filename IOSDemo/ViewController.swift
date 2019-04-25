//
//  ViewController.swift
//  IOSDemo
//
//  Created by 徐良坤 on 2019/4/22.
//  Copyright © 2019 xuliangkun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var table:UITableView!
    private let wnArr = ["41.87778,-87.62778","40.71,-74.01","25.78889,-80.22639","37.77500,-122.41944"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    lazy var dataArr: [String] = {
        let arr = ["Chicago","New-York","Miami","San Francisco"]
        return arr
    }()
    
    private func setUI(){
        let y = NEWNAVHEIGHT + CGFloat(71 * IPHONE_SCALE)
        table = UITableView.init(frame: CGRect.init(x: 0, y: y, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - y - TABBAR_HEIGHT))
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.tableFooterView = UIView.init()
        table.separatorStyle = .none
        table.backgroundColor = RGB(h: 0xF6F7F8, alpha: 1)
        self.view.addSubview(table)
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(64*IPHONE_SCALE)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table.dequeueReusableCell(withIdentifier: "cityCell")
        if cell == nil{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cityCell")
        }
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        if dataArr.count > indexPath.row{
            let vc = CityWeatherVC()
            vc.latitudeAndlongitude = wnArr[indexPath.row]
            vc.cityName = dataArr[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

