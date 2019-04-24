//
//  RoomModel.swift
//  Roomate
//
//  Created by Derek on 2019-04-23.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation

class RoomModel {
    
    //properties
    var id: Int?
    var admin_id: Int?
    var name: String?
    var address: String?
    var desc: String?
    var availibility: RoomAvailibility?
    var publicity: RoomPublicity?
    var created_date: String?
    
    init(data: [String:Any]) {
        
        self.id = data["id"] as? Int
        self.admin_id = data["admin_id"] as? Int
        self.name = data["name"] as? String
        self.address = data["address"] as? String
        self.desc = data["description"] as? String
        self.availibility = data["availibility"] as? RoomAvailibility
        self.publicity = data["publicity"] as? RoomPublicity
        self.created_date = data["created_date"] as? String
        
    }
    
    func to_dict(){
        var paramsDictionary = [String:Any]()
        paramsDictionary["name"] = name
        paramsDictionary["address"] = address
        paramsDictionary["description"] = desc
        paramsDictionary["availibility"] = availibility?.rawValue
        paramsDictionary["publicity"] = publicity?.rawValue
    }
    
    //prints object's current state
    
    public var description: String {
        return "ID: \(String(describing: id)), name: \(name ?? "none"), address: \(address ?? "none")"
        
    }
    
    
}
