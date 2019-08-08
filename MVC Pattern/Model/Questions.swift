//
//  Questions.swift
//  The MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

enum BooleanAnswer: String {
    case `true`
    case `false`
}

struct Question{
    let question: String
    let answer:BooleanAnswer
}

extension Question{
    func isGoodAnswer(result: String?) -> Bool{
        return result == answer.rawValue
    }
}


