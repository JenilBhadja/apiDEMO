//
//  ModelClass.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 09/02/23.
//

import Foundation

class userModelDataClass {
    
    var id : Int
    var name : String
    var username : String
    var email : String
    var phone :String
    var website : String
    var address: addressClass
    var company: companyClass
    
    
    
    init(id: Int, name: String, username: String, email: String, phone: String, website: String, address: addressClass, company: companyClass) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
        self.address = address
        self.company = company
    }
    
    init (dataClass : [String:Any]){
        self.id = dataClass["id"] as? Int ?? 0
        self.name = dataClass["name"] as? String ?? ""
        self.username = dataClass["username"] as? String ?? ""
        self.email = dataClass["email"] as? String ?? ""
        self.phone = dataClass["phone"] as? String ?? ""
        self.website = dataClass["website"] as? String ?? ""
        
        let address = dataClass["address"] as? [String :Any] ?? [:]
        self.address = addressClass(dataClass: address)
        
        let company = dataClass["company"] as? [String :Any] ?? [:]
        self.company = companyClass(dataClass: company)
    }
}

class addressClass {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: geoClass
    
    init(street: String, suite: String, city: String, zipcode: String, geo: geoClass) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    
    init (dataClass : [String : Any]){
        self.street = dataClass["street"] as? String ?? ""
        self.suite = dataClass["suite"] as? String ?? ""
        self.city = dataClass["city"] as? String ?? ""
        self.zipcode = dataClass["zipcode"] as? String ?? ""
        
        let geo = dataClass["geo"] as? [String:Any] ?? [:]
        self.geo = geoClass(dataClass: geo)
    }
    
}

class geoClass {
    var lat, lng: String
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    
    init(dataClass : [String : Any]) {
        self.lat = dataClass["lat"] as? String ?? ""
        self.lng = dataClass["lng"] as? String ?? ""
    }
    
}

class companyClass {
    var name: String
    var catchPhrase: String
    var bs: String
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
    init(dataClass : [String : Any]) {
        self.name = dataClass["name"] as? String ?? ""
        self.catchPhrase = dataClass["catchPhrase"] as? String ?? ""
        self.bs = dataClass["bs"] as? String ?? ""
    }
}






