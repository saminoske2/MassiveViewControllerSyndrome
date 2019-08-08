//
//  GameController.swift
//  The MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

//this manages everything about the current game (the big/main controller)
//“The UIViewController class defines the shared behavior that is common to all view controllers. You rarely create instances of the UIViewController class directly. Instead, you subclass UIViewController and add the methods and properties needed to manage the view controller's view hierarchy.”

//“A view controller's responsibilities include the following:

//Updating the contents of the views, usually in response to changes to the underlying data
//Responding to user interactions with views
//Resizing views and managing the layout of the overall interface
//Coordinating with other objects—including other view controllers—in your app”


class GameController{
    
    
    private let questions = QuestionController() //pulls the controller working the subset question data
    
    private let view = ViewController() //pulls the controller working the subset view data
    
    private func waitForAnswer(question: Question){
        //#1 wait for user input
        let result = redLine()
        //#2 ask the model if answer is good
        if question.isGoodAnswer(result: result){
            //update the view
            view.goodAnswer()
        }else{
            view.badAnswer()
        }
    }
    
    func start(){
        //load the questions
        questions.load()
        // from the model layer, get the next question
        while let question = questions.next(){ // while there are still questions to be asked in the [Questions]
        
            //display the question on the screen
            view.ask(question: question)
            
            waitForAnswer(question: question)
        }
        view.finishPlaying() // when there are no more questions, stop displaying questions
    }
    
    var input = ""
    
    func redLine() -> String{
        //do something
        //ask/prompt for input from user
        return input
    }
    
    
}



//when displaying a viewController on screen, whether from a modal presenttion, inside a navigation controller, or directly from the applicatiosn delegate window, methods will be called to help you manage its life cycle:

//viewDidLoad() - is called when the view loading has been performed, usually after the first access to th view property
//viewWillAppear(Bool) - is called just before the view is added to a view hirearchy
//viewDidLoad(Bool) - is when the view has been added to a view hirearchy.
//viewWillDissapear(Bool) -  is called when the view will be removed from a view hierarchy
//viewDidDissapear(Bool) - is called when the view has been removed from a view hierarchy
