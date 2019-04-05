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

class MyCardsViewController: CardsViewController {
    
    let cards: [CardController] = [TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController(),TestCardController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCards(cards: cards)
    }
}

class TestCardController: CardPartsViewController  {
    
    var viewModel = TestViewModel()
    var titlePart = CardPartTitleView(type: .titleOnly)
    var textPart = CardPartTextView(type: .normal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.title.asObservable().bind(to: titlePart.rx.title).disposed(by: bag)
        viewModel.text.asObservable().bind(to: textPart.rx.text).disposed(by: bag)
        
        setupCardParts([titlePart, textPart])
    }
}

class TestViewModel {
    
    var title = Variable("")
    var text = Variable("")
    
    init() {
        
        // When these values change, the UI in the TestCardController
        // will automatically update
        title.value = "Hello, world!"
        text.value = "CardParts is awesome!"
    }
}
