//
//  QuestionController.swift
//  The MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

class QuestionController {
    private var questions = [Question]()
    
    var questionOne = Question(question: "Is Donald Trump the president of the United States?", answer: BooleanAnswer(rawValue: "true")!)
    var questionTwo = Question(question: "Can mice fly?", answer: BooleanAnswer(rawValue: "false")!)
    var questionThree = Question(question: "Are you jamaican?", answer: BooleanAnswer(rawValue: "false")!)
    
    //load the question from memory or disk
    
    func load() {
        /* load from disk or memory, or else */
        questions = [questionOne, questionTwo, questionThree]
    }
    
    //Get the next question, if available
    func next() -> Question?{
        return questions.popLast()
    }
}

//Other than view controllers, models should not hold any logic relating to views and subviews, they should not hold any logic relating to the model layer. Controllers are simply bridges that get their information from the models, and update the view to reflect the current state.

