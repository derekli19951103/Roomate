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
    
//    let dispatchGroup = DispatchGroup()
//    var dictionary:[String:Any] = [String:Any]()
//    
    var fetch:Fetch?
    var fetch2:Fetch?
    
//    func fetchData(){
//        var paramsDictionary = [String:Any]()
//        paramsDictionary["email"] = "2"
//        paramsDictionary["password"] = "1"
//
//        dispatchGroup.enter()
//        Fetch.instance().makeAPICall(url: "http://localhost:8080/user/login", params:paramsDictionary, method: HttpMethod.POST, success: { (data, response, error) in
//            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
//            if let dictionary = json as? [String: Any] {
//                self.dictionary = dictionary
//                self.dispatchGroup.leave()
//            }
//        }, failure: { (data, response, error) in
//            print(error ?? "none")
//        })
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        firstname.text = firstnameText
//        lastname.text = lastnameText
//        email.text = emailText
//        password.text = passwordText
//        passwordAgain.text = passwordAgainText
//        telephone.text = telephoneText
//        birth.text = birthText
        var paramsDictionary = [String:Any]()
        paramsDictionary["email"] = "2"
        paramsDictionary["password"] = "1"
        fetch = Fetch(url: "http://localhost:8080/user/login",method: HttpMethod.POST,params:paramsDictionary)
        fetch?.delegate = self
        fetch?.then()
        var paramsDictionary2 = [String:Any]()
        paramsDictionary2["email"] = "1"
        paramsDictionary2["password"] = "1"
        fetch2 = Fetch(url: "http://localhost:8080/user/login",method: HttpMethod.POST,params:paramsDictionary2)
        fetch2?.delegate = self
        fetch2?.then()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didFinish(_ sender: Fetch){
        firstname.text = fetch?.data["firstname"] as? String
        lastname.text = fetch2?.data["lastname"] as? String
    }
    
}
