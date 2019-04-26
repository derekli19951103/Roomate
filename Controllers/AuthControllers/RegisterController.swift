//
//  RegisterController.swift
//  Roomate
//
//  Created by Derek on 2019-04-02.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit
import Foundation

class RegisterController: UIViewController {
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordii: UITextField!
    
    var userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func register(_ sender: Any) {
        if(passwordii.text==password.text){
            var user = [String:Any]()
            user["firstname"]=firstname.text
            user["lastname"]=lastname.text
            user["email"]=email.text
            user["tel"]=tel.text
            user["password_hash"]=password.text
            userService.register(user: user, completion: { result in
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
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please enter the same password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
