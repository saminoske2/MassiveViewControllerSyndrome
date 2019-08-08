//
//  PostMessageNetworkingModel.swift
//  MVC Pattern
//
//  Created by Quinton Quaye on 7/16/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

// the next step is to extract validation and networking logic into their own controllers. That way we can extend their own features, while maintaining a simple API surface:

class PostMessageNetworking{
    func post(message: String, callback: @escaping (Bool, Error?) -> Void){
        /* original call */
    }
}

class MessageValidator{
    enum ValidationError: Error{
        case emptyMessage
    }
    
    func validate(mesage: String) -> ValidationError?{
        if mesage.count == 0{
            print("Aint nothing here pimp!")
            return .emptyMessage
        }else{
            print("something is here!")
        }
        return nil
    }
}


//as you can see, none of these models interact with the view layer.
//Their interfaces are simple: one has a callback, the other returns an optional Error

//with this, the Viewcontroller can be subjected to UITeting, in order to ensure that the button tap calls the delegate properly, and so on.

// The network controller can be tested against serialization.

// The validator can be unit tested.

