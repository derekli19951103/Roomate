//
//  CardViewTest.swift
//  Roomate
//
//  Created by Derek on 2019-04-27.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    @IBOutlet weak var expense_title: UILabel!
    @IBOutlet weak var expense_desc: UILabel!
    @IBOutlet weak var expense_price: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //common func to init our view
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(rgb: 0x7F7FD5, a: 1.0).cgColor, UIColor(rgb: 0x86A8E7, a: 1.0).cgColor,UIColor(rgb: 0x91EAE4, a: 1.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        layer.insertSublayer(gradient, at: 0)
        layer.cornerRadius = 10;
        layer.masksToBounds = true;
    }
    
    
}

