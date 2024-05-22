//
//  TableViewController.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 08/02/23.
//

import UIKit
import Alamofire

class TableViewController: UIViewController {
    
    @IBOutlet weak var tblView : UITableView!
    
    //    var namesArrOfStr : [String] = []
    //    var userNameArrOfStr : [String] = []
    
    //    var coordinate:[(name:String,userName:String)] = []
    
    //    var userArray: [[String: String]] = []
    
//    var finalArr =  [modelData]()

//    var finalArr = [userModelData]()
    
    let params: Parameters =  [
        "name" : "Jenil" ,
        "lastName" : "Patel" ,
        "email" : "jenil.devstree@gmail.com",
        "address" : "Ahmedbad"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.apiCall()
        self.APICallPost()
        
    }
}

extension TableViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    
        return cell
    }
    
    
}

extension TableViewController {
    
    
    func APICallPost(){
        
        let thisParameters = ["Type":"ZDT"]
        
        AF.request("http://103.240.34.122:8091/api/User/GetDrawingsData",method: .get, parameters: thisParameters )
            .responseData { responseP in
            switch responseP.result {
            case .success(let data):
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]  {
                        print(json)
                    }
                    
                }catch{
                    
                }
            case .failure(let error):
                print(error)
            }
                
        }
        
        
//        AF.request("https://httpbin.org/post" ,method: .post ,).responseData { responseP in
//                switch responseP.result {
//                case .success(let data): break
//                case .failure(let error):
//                    print(error)
//                }
//            }
        
    }
    
    func apiCall(){
    
        AF.request("https://jsonplaceholder.typicode.com/users" ,method: .get)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]]{
//                            print(json) //arrOfDict
                            
                            
                            for  i in json{
                                print(i)
//                                let user = userModelData(data: i)
                                
//
//                                if let id = i["id"] as? Int,
//                                   let name = i["name"] as? String,
//                                   let username = i["username"] as? String,
//                                   let email = i["email"] as? String,
//                                   let phone = i["phone"] as? String,
//                                   let website = i["website"] as? String,
//
//                                   let address = i["address"] as? [String: Any],
//                                   let street = address["street"] as? String,
//                                   let suite = address["suite"] as? String,
//                                   let city = address["city"] as? String,
//                                   let zipcode = address["zipcode"] as? String,
//                                   let geo = address["geo"] as? [String: Any],
//                                   let lat = geo["lat"] as? String,
//                                   let lng = geo["lng"] as? String,
//
//                                   let company = i["company"] as? [String:Any],
//                                   let companyName = company["name"] as? String,
//                                   let companyCatchPhrase = company["catchPhrase"] as? String,
//                                   let companyBs = company["bs"] as? String {
//
//
//
//
//
//
//
////                                    print("id: \(id), name: \(name), username: \(username), email: \(email) website :\(website) phone:\(phone)")
////                                    print("company name: \(companyName), catch phrase: \(companyCatchPhrase), BS: \(companyBs)")
////                                    print("street: \(street), suite: \(suite), city: \(city), zipcode: \(zipcode), lat: \(lat), lng: \(lng)")
////
//////
////                                    let address = Address(street: street, suite: suite, city: city, zipcode: zipcode, geo: Geo(lat: lat, lng: lng))
////                                    let company = Company(name: companyName, catchPhrase: companyCatchPhrase, bs: companyBs)
////                                    let user = userModelData(id: id, name: name, username: username, email: email, address: address, phone: phone, website: website, company: company)
////
////                                    self.finalArr.append(user)
////                                    print(self.finalArr)
//
//                                }
                            }
                            
                            
//                            self.tblView.reloadData()

                        }
                    }catch {
                        print("errorMsg")
                    }
                case let .failure(error):
                    print(error)
                }
            }
        
    }
}




//self.userArray = json.map { response -> [String: String] in
//
//    if let name = response["name"] as? String,
//       let username = response["username"] as? String {
//
//        return ["name": name, "username": username]
//
//    }
//    return [:]
//}
//print(self.userArray)


//for i in json{
//
//    if let name = i["name"] as? String,let username = i["username"]as? String {
//
//        self.userArray.append(["name": name,
//                               "username": username])
//
//        print(self.userArray)
//    }
//}

