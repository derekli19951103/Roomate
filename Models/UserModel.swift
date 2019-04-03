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
    
    init(data: [String:Any]) {
        
        self.id = data["id"] as? Int
        self.firstname = data["firstname"] as? String
        self.lastname = data["lastname"] as? String
        self.birth = data["birth"] as? String
        self.avatar = data["avatar"] as? String
        self.email = data["email"] as? String
        self.tel = data["tel"] as? String
        self.password = data["password"] as? String
        
    }
    
    func to_dict(){
        var paramsDictionary = [String:Any]()
        paramsDictionary["firstname"]=firstname
        paramsDictionary["lastname"]=lastname
        paramsDictionary["birth"]=birth
        paramsDictionary["avatar"]=avatar
        paramsDictionary["email"]=email
        paramsDictionary["tel"]=tel
        paramsDictionary["password"]=password
    }
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(String(describing: id)), firstname: \(firstname ?? "none"), lastname: \(lastname ?? "none")"
        
    }
    
    
}
