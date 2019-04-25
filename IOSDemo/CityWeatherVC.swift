//
//  CityWeatherVC.swift
//  IOSDemo
//
//  Created by 徐良坤 on 2019/4/25.
//  Copyright © 2019 xuliangkun. All rights reserved.
//

import UIKit
import SDWebImage
import MapKit

class CityWeatherVC: UIViewController {
    var cityName: String = ""
    var weekData:[WeekInfoModel] = []
    var latitudeAndlongitude:String = ""
    
    private let cityNameL = UILabel.init()
    private var collectionV:UICollectionView! //流布局视图对象
    private var flowLayout:UICollectionViewFlowLayout! //流布局规则
    private var mapView:MKMapView = MKMapView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .white
        
        self.createCollectionV()
        setUI()
        
    }
    
    private func setUI(){
        cityNameL.frame = CGRect.init(x: CGFloat(10 * IPHONE_SCALE), y: NEWNAVHEIGHT + CGFloat(10 * IPHONE_SCALE), width: SCREEN_WIDTH - CGFloat(10 * IPHONE_SCALE), height: CGFloat(15 * IPHONE_SCALE))
        cityNameL.textColor = .darkGray
        cityNameL.font = pingfangRegularFontStyle(size: 12)
        cityNameL.textAlignment = .left
        self.view.addSubview(cityNameL)
        
        mapView.frame = CGRect.init(x: CGFloat(10 * IPHONE_SCALE), y: NEWNAVHEIGHT + CGFloat(400 * IPHONE_SCALE), width: SCREEN_WIDTH - CGFloat(10 * IPHONE_SCALE), height: CGFloat(100 * IPHONE_SCALE))
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        self.cityNameL.text = String.init(format: "city:%@", cityName)
        
        weak var ws = self
        WeatherVM.getWeatherInfoRequest(point: latitudeAndlongitude) {(result) in
            
            ws?.locateTolatitude(latitude: result.latitude, longitude: result.longitude)
            WeatherVM.getWeekWeatherInfoRequest(url: result.forecastHourly, suc: { (result) in
                ws?.weekData = result
                ws?.collectionV.reloadData()
                
            })
        }
    }
    
    private func locateTolatitude(latitude: Double, longitude:Double){
        var center: CLLocationCoordinate2D = CLLocationCoordinate2D.init()
        center.latitude = latitude
        center.longitude = longitude
        
        var span:MKCoordinateSpan = MKCoordinateSpan.init()
        span.latitudeDelta = 0.01
        span.longitudeDelta = 0.01
        
        var region: MKCoordinateRegion = MKCoordinateRegion.init()
        region.center = center
        region.span = span
        
        mapView.setRegion(region, animated: true)
    }
    
    private func createCollectionV(){
        if collectionV == nil{
            flowLayout = UICollectionViewFlowLayout.init()
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            
            collectionV = UICollectionView.init(frame: CGRect.init(x: 0, y: NEWNAVHEIGHT + CGFloat(120 * IPHONE_SCALE), width: SCREEN_WIDTH, height: CGFloat(160 * IPHONE_SCALE)), collectionViewLayout: self.flowLayout)
            collectionV.showsVerticalScrollIndicator = false
            collectionV.showsHorizontalScrollIndicator = false
            collectionV.backgroundColor = RGB(h: 0xfafafa, alpha: 1)
            collectionV.bounces = false
            collectionV.delegate = self
            collectionV.dataSource = self
            collectionV.register(UINib.init(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCell")
            self.view.addSubview(self.collectionV)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }


}

extension CityWeatherVC:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WeatherCell = collectionV.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        if weekData.count > indexPath.row{
            let model = weekData[indexPath.row]
            cell.weekName.text = model.startTime
            cell.weatherImg.sd_setImage(with: URL.init(string: model.icon), placeholderImage: nil, options: SDWebImageOptions.init(), completed: nil)
            cell.weatherName.text = model.shortForecast
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize.init(width: CGFloat(100 * IPHONE_SCALE), height: CGFloat(160 * IPHONE_SCALE))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


extension CityWeatherVC:MKMapViewDelegate{
    
}
