//
//  UserModel.swift
//  Roomate
//
//  Created by Derek on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    
    //properties
    var id: Int?
    var firstname: String?
    var lastname: String?
    var birth: String?
    var avatar: String?
    var email: String?
    var tel: String?
    var password: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(id: Int, firstname: String, lastname: String, birth: String, avatar: String, email: String, tel: String, password: String) {
        
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.birth = birth
        self.avatar = avatar
        self.email = email
        self.tel = tel
        self.password = password
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(String(describing: id)), firstname: \(firstname ?? "none"), lastname: \(lastname ?? "none")"
        
    }
    
    
}
