//
//  CreateRoomController.swift
//  Roomate
//
//  Created by Derek on 2019-04-26.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class CreateRoomController: UIViewController{
    
    @IBOutlet weak var roomname: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var pubSelector: UISegmentedControl!
    
    var publicity = RoomPublicity.PUBLIC
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pubSelectorAction(_ sender: Any) {
        switch pubSelector.selectedSegmentIndex {
        case 0:
            publicity = RoomPublicity.PUBLIC
        case 1:
            publicity = RoomPublicity.PRIVATE
        default:
            publicity = RoomPublicity.PUBLIC
        }
    }
    
    @IBAction func create_room(_ sender: Any) {
        var room = [String:Any]()
        room["name"]=roomname.text
        room["address"]=address.text
        room["availibility"]=RoomAvailibility.ACTIVE.rawValue
        room["publicity"]=publicity.rawValue
        userService.create_room(info: room, completion: { result in
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
