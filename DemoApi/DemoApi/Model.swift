//
//  Model.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 08/02/23.
//

import Foundation
import UIKit

struct modelData {
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
    
    init(postId : Int ,id: Int, name: String, email: String, body: String) {
        self.postId = postId
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}



struct userModelData {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    init(data : [String :Any ]){
        self.id = data["id"] as? Int ?? 0
        self.name = data["name"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.phone = data["phone"] as? String ?? ""
        self.website = data["website"] as? String ?? ""
        
        let address = data["address"] as? [String :Any] ?? [:]
        self.address = Address(data: address)
        
        let company = data["company"] as? [String :Any] ?? [:]
        self.company = Company(data: company)   
    }
}

struct Address {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
    
    init (data : [String : Any]){
        self.street = data["street"] as? String ?? ""
        self.suite = data["suite"] as? String ?? ""
        self.city = data["city"] as? String ?? ""
        self.zipcode = data["zipcode"] as? String ?? ""
        let geo = data["geo"] as? [String:Any] ?? [:]
        self.geo = Geo(data: geo)
    }
    
}

struct Geo {
    var lat, lng: String
    
    init(data : [String : Any]) {
        self.lat = data["lat"] as? String ?? ""
        self.lng = data["lng"] as? String ?? ""
    }
    
}

struct Company {
    var name: String
    var catchPhrase: String
    var bs: String
    
    init(data : [String : Any]) {
        self.name = data["name"] as? String ?? ""
        self.catchPhrase = data["catchPhrase"] as? String ?? ""
        self.bs = data["bs"] as? String ?? ""
    }
}




