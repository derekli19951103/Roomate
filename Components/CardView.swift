//
//  CardView.swift
//  Roomate
//
//  Created by Derek on 2019-04-24.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    var width: CGFloat?
    var height: CGFloat?
    var header: String = "Title"
    var initiator: String = "Initiator"
    var desc: String = "Description"
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(rgb: 0x7F7FD5, a: 1.0).cgColor, UIColor(rgb: 0x86A8E7, a: 1.0).cgColor,UIColor(rgb: 0x91EAE4, a: 1.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true;
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 10, width: width, height: 20))
        headerLabel.text = header
        headerLabel.font = UIFont(name: headerLabel.font.fontName, size: 20)
        self.addSubview(headerLabel)
        
        let initiatorLabel = UILabel(frame: CGRect(x: 10, y: 10+height/4, width: width, height: 10))
        initiatorLabel.text = initiator
        initiatorLabel.font = UIFont(name: initiatorLabel.font.fontName, size: 10)
        self.addSubview(initiatorLabel)
        
        let descLabel = UILabel(frame: CGRect(x: 10, y: 10+2*height/4, width: width, height: 10))
        descLabel.text = desc
        descLabel.font = UIFont(name: descLabel.font.fontName, size: 10)
        self.addSubview(descLabel)
        
        let button = UIButton(frame: CGRect(x: width-100, y: 10+3*height/4, width: 50, height: 10))
        button.setTitle("JOIN", for: .normal)
        self.addSubview(button)
    }
    
    func setHeader(header: String) {
        self.header = header
    }
    
    func setInitiator(initiator: String) {
        self.initiator = initiator
    }
    
    func setDesc(desc: String) {
        self.desc = desc
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
