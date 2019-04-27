//
//  UserInfoController.swift
//  Roomate
//
//  Created by Derek on 2019-04-02.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit
import Pilas

class UserInfoController: UIViewController {
    
    @IBOutlet weak var stackViewScrollView: PilasScrollView!
    var userService = UserService()
    var users = [User]()
    var rooms = [Room]()
    var divider_color = UIColor(red: 239, green: 239, blue: 239)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.users = userService.fetchLocalUsers()
        self.rooms = userService.fetchLocalRooms()
        stackViewScrollView.enableKeyboardNotifications = false
        stackViewScrollView.showsVerticalScrollIndicator = false
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: divider_color)
        stackViewScrollView.insertView(view: UserProfileSeg(), height: 200)
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: divider_color)
        stackViewScrollView.insertView(view: insertRoomProfileView(), height: 200)
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: divider_color)
    }
    
    func UserProfileSeg() -> UIView {
        let view = UINib(nibName: "UserProfileSeg", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UserProfileSeg
        view.firstname.text = self.users[0].firstname
        view.lastname.text = self.users[0].lastname
        view.tel.text = self.users[0].tel
        return view
    }
    
    
    func insertRoomProfileView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250))
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.view.bounds.width, height: 20))
        headerLabel.text = self.rooms[0].name
        headerLabel.font = UIFont(name: headerLabel.font.fontName, size: 20)
        view.addSubview(headerLabel)
        return view
    }
    
}

