//
//  NotificationController.swift
//  Roomate
//
//  Created by Derek on 2019-04-04.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import UIKit
import Pilas

class NotificationController: UIViewController{
    
    @IBOutlet weak var stackViewScrollView: PilasScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewScrollView.enableKeyboardNotifications = true
        stackViewScrollView.showsVerticalScrollIndicator = false
        insertCardsViews()
    }
    
    private func insertCardsViews() {
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: UIColor.white)
        setupCardView()
        setupCardView()
        setupCardView()
        setupCardView()
    }
    
//    private func sampleHorizontalPilasScrollView() -> PilasScrollView {
//        let horizontalScrollView = PilasScrollView();
//        horizontalScrollView.axis = .horizontal
//
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//        horizontalScrollView.insertView(view: sampleBackgroundView(backgroundColor: UIColor.darkGray), width: 75)
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//
//        horizontalScrollView.insertView(view: sampleBackgroundView(backgroundColor: UIColor.darkGray), width: 75)
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//
//        horizontalScrollView.insertView(view: sampleBackgroundView(backgroundColor: UIColor.darkGray), width: 75)
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//
//        horizontalScrollView.insertView(view: sampleBackgroundView(backgroundColor: UIColor.darkGray), width: 75)
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//
//        horizontalScrollView.insertView(view: sampleBackgroundView(backgroundColor: UIColor.darkGray), width: 75)
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//
//        horizontalScrollView.insertView(view: sampleBackgroundView(backgroundColor: UIColor.darkGray), width: 75)
//        horizontalScrollView.insertDividerView(width: 10, backgroundColor: UIColor.black)
//
//        return horizontalScrollView
//    }
    
    
    private func setupCardView(){
        stackViewScrollView.insertView(view: CardView(width: view.bounds.width, height: 200), height: 200)
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: UIColor.white)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

