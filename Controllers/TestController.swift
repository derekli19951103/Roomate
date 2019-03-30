//
//  TestController.swift
//  Roomate
//
//  Created by iNks_SWAT on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class TestController: UIViewController {
    
    @IBOutlet weak var firstname: UILabel!
    
    @IBOutlet weak var lastname: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var passwordAgain: UILabel!
    
    @IBOutlet weak var telephone: UILabel!
    
    @IBOutlet weak var birth: UILabel!
    
    var firstnameText = ""
    var lastnameText = ""
    var emailText = ""
    var passwordText = ""
    var passwordAgainText = ""
    var telephoneText = ""
    var birthText = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var paramsDictionary = [String:Any]()
        
        paramsDictionary["email"] = "1"
        paramsDictionary["password"] = "1"
        
        Fetch.instance().makeAPICall(url: "http://localhost:8080/user/login", params:paramsDictionary, method: HttpMethod.POST, success: { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            print(json!)
            if let dictionary = json as? [String: Any] {
                
                self.firstname.text = dictionary["firstname"] as? String
        
                self.lastname.text = dictionary["lastname"] as? String
        
                self.email.text = dictionary["email"] as? String
        
                self.telephone.text = dictionary["tel"] as? String
                
                self.birth.text = dictionary["birth"] as? String
                
                }
            
        }, failure: { (data, response, error) in
            
            print(error ?? "none")
            
        })
        firstname.text = firstnameText
        lastname.text = lastnameText
        email.text = emailText
        password.text = passwordText
        passwordAgain.text = passwordAgainText
        telephone.text = telephoneText
        birth.text = birthText
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
