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
