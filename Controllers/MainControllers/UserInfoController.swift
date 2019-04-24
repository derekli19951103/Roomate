//
//  UserInfoController.swift
//  Roomate
//
//  Created by Derek on 2019-04-02.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit

class UserInfoController: UIViewController {
    
    var user:UserModel?
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var roomname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstname.text = user?.firstname
        let rooms = user!.getRooms()
        roomname.text = rooms[0].name
    }
    
    
}

