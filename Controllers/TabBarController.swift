//
//  TestController.swift
//  Roomate
//
//  Created by iNks_SWAT on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    var user:UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewControllers![3])
//        let userinfo = viewControllers![3] as! UserInfoController
//        userinfo.user = user
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
