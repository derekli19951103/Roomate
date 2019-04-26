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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.users = userService.fetchLocalUsers()
        stackViewScrollView.enableKeyboardNotifications = false
        stackViewScrollView.showsVerticalScrollIndicator = false
        stackViewScrollView.insertView(view: insertUserProfileView(), height: 200)
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: UIColor.gray)
    }
    
    func insertUserProfileView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250))
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 10, width: self.view.bounds.width, height: 20))
        headerLabel.text = self.users[0].firstname
        headerLabel.font = UIFont(name: headerLabel.font.fontName, size: 20)
        view.addSubview(headerLabel)
        return view
    }
    
}

