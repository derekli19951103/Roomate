//
//  TestCards.swift
//  Roomate
//
//  Created by Derek on 2019-04-04.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation
import CardParts
import RxCocoa
import RxSwift
import RxAtomic
import RxGesture
import RxDataSources

import UIKit
import CardParts

class ThemeViewController: CardsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Comment out one of the loadCard functions to change cards and/or their order
        let cards: [CardPartsViewController] = [
            ThemedCardController(title: "These"),
            ThemedCardController(title: "Are"),
            ThemedCardController(title: "Themed"),
            ThemedCardController(title: "Cards!")
        ]
        
        loadCards(cards: cards)
    }
}

