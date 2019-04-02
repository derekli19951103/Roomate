//
//  TestController.swift
//  Roomate
//
//  Created by iNks_SWAT on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class TestController: UIViewController,FetchDelegate {
    
    @IBOutlet weak var firstname: UILabel!
    
    @IBOutlet weak var lastname: UILabel!
    
    
    var emailText = ""
    var passwordText = ""
    
    var fetch:Fetch?
    
    override func viewDidLoad() {
    
        var paramsDictionary = [String:Any]()
        print(self.emailText+"no")
        paramsDictionary["email"] = self.emailText
        paramsDictionary["password"] = self.passwordText
        fetch = Fetch(url: "http://localhost:8080/user/login",method: HttpMethod.POST,params:paramsDictionary)
        fetch?.delegate = self
        fetch?.then()
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didFinish(_ sender: Fetch){
        firstname.text = fetch?.data["firstname"] as? String
        lastname.text = fetch?.data["lastname"] as? String
    }
    
}
