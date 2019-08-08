//
//  ViewController.swift
//  The MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

class ViewController{
    private let questionView = QuestionView()
    
    private let promptView = PromptView()
    
    
    func ask(question: Question) {
        questionView.show(question: question) //shows the question
        promptView.show() // shows something...
    }
    
    func goodAnswer(){
        /*implement me */
        print("Good Job!")
    }
    func badAnswer(){
        /*implement me */
        print("Terrible")
    }
    func finishPlaying(){
        /*implement me */
        print("This concludes our test")
    }
}
