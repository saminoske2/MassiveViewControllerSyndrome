//
//  RefactoredPostMessageController.swift
//  MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import UIKit

//This will tie all the items together and work cohesively

//We need to port in the message-sending logic, as well as the error handling; and we should be done:

class PostMaessageController: UIViewController, ComposeViewControllerDelegate{
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBbutton: UIButton!
    //takes the type of protocol and its attributes
    
    //store references to the viewController: the ValidationController and the NetworkingController() classes
    let viewController = ComposeViewController()
    let validator = MessageValidator()
    let networking = PostMessageNetworking()
    
    //initialize the viewController() delegate for this Controller - this implementation is the core of the logic that ties the view layer to the model layer(which is the responsibility of the controller layer)
    
    override func viewDidLoad() {
         viewController.delegate = self
    }
    
    @IBAction func sendButton(){
        composeViewController(viewController, attemptedToSend: textView.text!)
    }
    
    // this method will validate the message, attempt to send it and update the view layer to provide feedback to the user through the State property of the ComposeViewController()
    func composeViewController(_ controller: ComposeViewController, attemptedToSend message: String) {
        
        //print("Printing: \(textView.text!)")
        
        if let error = validator.validate(mesage: message){
            viewController.state = .error(error)
            return
        }
        
        viewController.state = .sending
        networking.post(message: message) { (success, error) in
            if let error = error {
                self.viewController.state = .error(error)
            }else{
                 
                self.viewController.state = .default
            }
        }
    }
}


//PostMessageController has been implemented as a true conroller, in the MVC case. Its shows how one controller can and should orchestrate the communication between the view layer and the model layer. Inplementing this design pattern will ultimately improve the quality of your code base!!
