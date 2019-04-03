//
//  SigninController.swift
//  Roomate
//
//  Created by Derek on 2019-04-02.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import UIKit
import Foundation

class SigninController: UIViewController,FetchDelegate {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var fetch:Fetch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        var paramsDictionary = [String:Any]()
        paramsDictionary["email"]=email.text
        paramsDictionary["password"]=password.text
        fetch = Fetch(url: "http://localhost:8080/user/login",method: HttpMethod.POST,params:paramsDictionary)
        fetch?.delegate = self
        fetch?.then()
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
