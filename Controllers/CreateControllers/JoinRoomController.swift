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
        let room_id = self.room_id.text
        userService.request_room(room_id: Int64(room_id!)!, completion: { result in
            switch result {
            case .success:
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let tab = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                self.present(tab, animated: true, completion: nil)
            case .failure(let error):
                let alert = UIAlertController(title: "Alert", message: "\(error)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
}
