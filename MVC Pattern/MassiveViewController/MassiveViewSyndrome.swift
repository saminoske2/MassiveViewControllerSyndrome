//
//  MassiveViewSyndrome.swift
//  GameProject
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import UIKit

// you should consider using controllers to help communicate with complex model layers. Code bases that suffer from Massive View Syndrome oftem exhibit the following pathologies in their view controllers:

//Network calls, logic, and parsing
//Caches, data stores, or coreData logic
// Business logic or validators


class MassiveViewController: UIViewController{
    var textView = UITextView()
    var sendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* layout the views */
        /* design the views */
    }
    
    //**ISSUE: content validation
    func sendTapped(sender: UIButton){
        if textView.text.count == 0{
            //display error
        }else{
            postMessage(message: textView.text){ (success, error) in
                if success {
                    // all good
                }else{
                    // show error alert
                }
            }
        }
    }
    
    //**ISSUE: encoding & decoding
    struct BooleanResponse: Codable {
        let success: Bool
    }
    
    struct MessageRequest: Codable {
        let message: String
    }
    
    
    //**ISSUE: URL logic & encoding & decoding
    var postMessageAPIURL = URL(fileURLWithPath: "somewhere.com/API")
    
    private func postMessage(message: String, callback: @escaping (Bool, Error?) -> Void) {
        let messagePayload = MessageRequest(message: message)
        var request = URLRequest(url: postMessageAPIURL)
        request.httpMethod = "POST"
        do{
            try request.httpBody = JSONEncoder().encode(messagePayload)
        } catch let error{
            callback(false, error)
            return
        }
        
        //**ISSUE: error handling
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                callback(false, error)
            }else if let data = data {
                do{
                    let result = try JSONDecoder().decode(BooleanResponse.self, from: data)
                    callback(result.success, nil)
                }catch let error{
                    callback(false, error)
                }
            }
        }
    }
}



//All the code is set into a view controller, when this controller grows in features and design, it will quickly become unmaintainable, let do the following with these goals in mind:

//#1 The view controller should be responsibble for view handling and exposing its state
//#2 Network calls should be extracted to their own controller
//#3 Validation should be extracted, as more rules may be added later
