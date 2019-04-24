//
//  RegisterController.swift
//  Roomate
//
//  Created by Derek on 2019-04-02.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit
import Foundation

class RegisterController: UIViewController,FetchDelegate {
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordii: UITextField!
    
    var fetch:Fetch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func register(_ sender: Any) {
        if(passwordii.text==password.text){
            var paramsDictionary = [String:Any]()
            paramsDictionary["firstname"]=firstname.text
            paramsDictionary["lastname"]=lastname.text
            paramsDictionary["email"]=email.text
            paramsDictionary["tel"]=tel.text
            paramsDictionary["password"]=password.text
            fetch = Fetch(url: "http://localhost:8080/userAPI/register",method: HttpMethod.POST,params:paramsDictionary)
            fetch?.delegate = self
            fetch?.then()
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please enter the same password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func didFinish(_ sender: Fetch) {
        let user = UserModel(data: fetch!.data)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tab = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        tab.user = user
        self.present(tab, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
