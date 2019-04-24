//
//  TestController.swift
//  Roomate
//
//  Created by iNks_SWAT on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController,FetchDelegate {
    var user:UserModel?
    var fetch:Fetch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewControllers![0])
        print(viewControllers![1])
        print(viewControllers![2])
        print(viewControllers![3])
        
        let paramsDictionary = [String:Any]()
        let id = user!.id ?? 0
        let url = "http://localhost:8080/userAPI/"+"\(id)"+"/rooms"
        fetch = Fetch(url: url,method: HttpMethod.GET,params:paramsDictionary)
        fetch?.delegate = self
        fetch?.then()
    }
    
    func didFinish(_ sender: Fetch) {
        let userInfoNav = viewControllers![3] as! UINavigationController
        let userinfo = userInfoNav.topViewController as! UserInfoController
        
        let rooms = fetch!.data["rooms"] as? NSArray
        var roomsArray = [RoomModel]()
        for r in rooms!{
            let room = RoomModel(data: r as! [String : Any])
            roomsArray.append(room)
        }
        user!.setRooms(updatedRooms: roomsArray)
        userinfo.user = user
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
