//
//  ViewController.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 31/01/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var colView : UICollectionView!
    
    
    //        enum Result<Data, AFError>{
    //            case sucess(Data)
    //            case failuer(AFError)
    //        }
    
    //    var geo = [[String:Any]] ()
    
    //    var geoValues: [(latitude: String, longitude: String)] = []
    
    var coordinate:[(lat:Double,lng:Double)] = []
    
    
    
    override func viewDidLoad(){
        //        self.getAPICall()
        self.postAPICall()
        
        //        let result = Result<String, Any>.sucess("jenil")
        
        super.viewDidLoad()
    }
}




extension ViewController {
    
    //    func getAPICall() {
    //        AF.request("https://jsonplaceholder.typicode.com/users",method: .get)
    //            .responseData { response in
    //                switch response.result {
    //                case  let .success(data):
    //                    do {
    //                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
    //                        print(json)
    //                    } catch {
    //                        print("errorMsg")
    //                    }
    //                case let .failure(error):
    //                    print(error)
    //                }
    //            }
    //    }
    
    func postAPICall(){

        AF.request("https://jsonplaceholder.typicode.com/users" ,method: .get)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]]{
                            print(json)
                            
                            for i in json {
                                if let address = i["address"] as? [String:Any],
                                   let geoData = address["geo"] as? [String:Any]{
                                    print(geoData)
                                    
                                        
//                                    if let doubleLat = Double(geoData["lat"] as! String),
//                                       let doubleLng = Double(geoData["lng"] as! String){
//                                        self.coordinate.append((lat: doubleLat, lng: doubleLng))
//                                    }
                                    
                                    
                                    if let latitude = geoData["lat"] as? String,let longitude = geoData["lng"] as? String {
                                        
                                        if let doubleLatitude = Double(latitude),
                                           let doubleLongitude = Double(longitude){
                                            self.coordinate.append((lat: doubleLatitude, lng: doubleLongitude))
                                        }
                                    }
                                    
                                    
                                }
                            }
                            print(self.coordinate)
                            
                        }
                    }
                    catch {
                        print("errorMsg")
                    }
                case let .failure(error):
                    print(error)
                }
            }
        
    }
}





//{
//    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
//        //print(jsonArray)
//        for i in jsonArray{
//            //print(i["name"]!)
//            if let name = i["name"]{
//                print(name)
//            }
//        }
//    }
//}


