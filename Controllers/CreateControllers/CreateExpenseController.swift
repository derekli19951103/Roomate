//
//  CreateExpenseController.swift
//  Roomate
//
//  Created by iNks_SWAT on 2019-05-10.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class CreateExpenseController: UIViewController{
    @IBOutlet weak var e_title: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var frequency: UITextField!
    
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func submit_expense(_ sender: Any) {
//        let user_id = userService.fetchLocalUsers()[0].id
        var expense = [String:Any]()
        expense["title"] = e_title.text
        expense["type"] = type.text
        expense["desc"] = desc.text
        expense["total_price"] = price.text
        expense["frequency"] = frequency.text
        expense["creator_id"] = 1
        expense["status"] = "Unpaid"
        
        userService.createExpense(info: expense, room_id: 3, all_users: [1,2]) { result in
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
        
        }
    
    
    }
}
