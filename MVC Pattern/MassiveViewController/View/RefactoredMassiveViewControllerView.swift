//
//  RefactoredMassiveViewControllerView.swift
//  MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController{
    
    enum State {
        case `default`
        case error(Error)
        case sending
    }
    
    //private var textView = UITextView()
    //private var sendButton = UIButton()
    weak var delegate: ComposeViewControllerDelegate? //will be used on Controllers
    
    var state: State = .default{
        didSet {
            /* todo handle state */
            switch state{
            case .sending:
                //sendData
                print("data is being sent")
            default:
                break
            }
        }
    }
    
    
    //func sendTapped(sender: UIButton){
      //  delegate?.composeViewController(self, attemptedToSend: textView.text)
    //}
}



//This view is now completely focused on manageing views!
// its easier to extend / test and manage.
//if we have more actions in the future, such as picking a photo or gif, it is easier to add this feature without cluttering up the code for the composition message

