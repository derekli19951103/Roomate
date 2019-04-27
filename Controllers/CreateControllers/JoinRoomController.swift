//
//  JoinRoomController.swift
//  Roomate
//
//  Created by Derek on 2019-04-26.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class JoinRoomController: UIViewController{
    
    
    @IBOutlet weak var room_id: UITextField!
    
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func join_room(_ sender: Any) {
    }
    
}
