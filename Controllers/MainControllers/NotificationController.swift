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
         let view = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CardView
        view.expense_desc.text="ahsdjgasgd"
        stackViewScrollView.insertView(view: view,height: view.bounds.height)
        stackViewScrollView.insertDividerView(height: 10, backgroundColor: UIColor.white)
    }
}

