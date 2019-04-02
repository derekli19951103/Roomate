//
//  FetchDelegate.swift
//  Roomate
//
//  Created by Derek on 2019-03-30.
//  Copyright © 2019 Yufeng Li. All rights reserved.
//

import Foundation

//
// This is the DELEGATE PROTOCOL
//
protocol FetchDelegate {
    // Classes that adopt this protocol MUST define
    // this method -- and hopefully do something in
    // that definition.
    func didFinish(_ sender:Fetch)
}
