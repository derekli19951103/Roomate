//
//  SigninController.swift
//  Roomate
//
//  Created by Derek on 2019-04-02.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit
import Foundation

class SigninController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        var info = [String:Any]()
        info["email"]=email.text
        info["password_hash"]=password.text
        userService.login(info: info, completion: { result in
            switch result {
            case .success:
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let tab = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                self.present(tab, animated: true, completion: nil)
            case .failure(let error):
                let alert = UIAlertController(title: "Alert", message: "Login Fail: \(error)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
