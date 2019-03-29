//
//  InformationController.swift
//  Roomate
//
//  Created by iNks_SWAT on 2019-03-29.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit
import Foundation

class InformationController: UIViewController {
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!

    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordAgain: UITextField!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var birth: UITextField!
    
    var firstnameText = ""
    var lastnameText = ""
    var emailText = ""
    var passwordText = ""
    var passwordAgainText = ""
    var telephoneText = ""
    var birthText = ""
    
    
    @IBAction func submitForm(_ sender: Any) {
        self.firstnameText = firstname.text!
        self.lastnameText = lastname.text!
        self.emailText = email.text!
        self.passwordText = password.text!
        self.passwordAgainText = passwordAgain.text!
        self.telephoneText = telephone.text!
        self.birthText = birth.text!
        performSegue(withIdentifier: "info", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! TestController
        dest.firstnameText = self.firstnameText
        dest.lastnameText = self.lastnameText
        dest.emailText = self.emailText
        dest.passwordText = self.passwordText
        dest.passwordAgainText = self.passwordText
        dest.telephoneText = self.telephoneText
        dest.birthText = self.birthText
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
}




