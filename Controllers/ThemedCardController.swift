//
//  ThemedCardController.swift
//  CardParts_Example
//
//  Created by Roossin, Chase on 5/23/18.
//  Copyright © 2018 Intuit. All rights reserved.
//

import Foundation
import CardParts

class ThemedCardController: CardPartsViewController {
    
    let cardPartTitleDescriptionViewRight = CardPartTitleDescriptionView(titlePosition: .top, secondaryPosition: .right)
    let cardPartTitleDescriptionViewCenter = CardPartTitleDescriptionView(titlePosition: .top, secondaryPosition: .center(amount: 0))
    
    let possibleGradientColors: [UIColor] = [
        UIColor(red: 181.0 / 255.0, green: 152.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0),
        UIColor(red: 30.0 / 255.0, green: 211.0 / 255.0, blue: 212.0 / 255.0, alpha: 1.0),
        UIColor(red: 63.0 / 255.0, green: 236.0 / 255.0, blue: 216.0 / 255.0, alpha: 1.0),
        UIColor(red: 27.0 / 255.0, green: 205.0 / 255.0, blue: 156.0 / 255.0, alpha: 1.0),
        UIColor(red: 10.0 / 255.0, green: 199.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0),
        UIColor(red: 17.0 / 255.0, green: 174.0 / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
    ]
    
    var _title: String = ""
    
    convenience init(title: String) {
        self.init(nibName: nil, bundle: nil)
        self._title = title
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardPartTitleDescriptionViewRight.leftTitleText = "Look at my alignemnt"
        cardPartTitleDescriptionViewRight.rightTitleText = ".right aligned!"
        
        cardPartTitleDescriptionViewCenter.leftTitleText = "Look now!"
        cardPartTitleDescriptionViewCenter.rightTitleText = ".center aligned"
        
        setupCardParts([cardPartTitleDescriptionViewRight, cardPartTitleDescriptionViewCenter])
        
        view.addConstraint(NSLayoutConstraint(item: view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 140))
    }
}

//extension ThemedCardController: ShadowCardTrait {
//    func shadowColor() -> CGColor {
//        return UIColor.lightGray.cgColor
//    }
//    
//    func shadowRadius() -> CGFloat {
//        return 10.0
//    }
//    
//    func shadowOpacity() -> Float {
//        return 0.8
//    }
//}

extension ThemedCardController: RoundedCardTrait {
    func cornerRadius() -> CGFloat {
        return 10.0
    }
}

extension ThemedCardController: GradientCardTrait {
    func gradientColors() -> [UIColor] {
        
        let color1: UIColor = self.possibleGradientColors[Int(arc4random_uniform(UInt32(self.possibleGradientColors.count)))]
        var color2: UIColor = self.possibleGradientColors[Int(arc4random_uniform(UInt32(self.possibleGradientColors.count)))]
        
        while color1 == color2 {
            color2 = self.possibleGradientColors[Int(arc4random_uniform(UInt32(self.possibleGradientColors.count)))]
        }
        
        return [color1, color2]
    }
    
    func gradientAngle() -> Float {
        return 45.0
    }
}
