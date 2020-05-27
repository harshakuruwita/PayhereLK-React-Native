//
//  Payhere.swift
//  xcapp
//
//  Created by Harsha Kuruwita on 3/7/20.
//  Copyright © 2020 Facebook. All rights reserved.
//



import Foundation
import payHereSDK
import UIKit



@objc(Payhere) class Payhere: UIViewController {

@objc static var isOn = false

  @objc static func requiresMainQueueSetup() -> Bool {
    return false
  }
  @objc(callbackMethod:)
  func callbackMethod(callback: @escaping RCTResponseSenderBlock) -> Void {
    let resultsDict = [
      "success" : true
    ];
    
    
      let req : InitRequest = InitRequest()
       req.merchantId = "1210251"      // Your Merchant ID
       req.merchantSecret = "bhasha2"  // Your Merchant secret
       req.amount = 100.0              // Amount which the customer should pay
       req.currency = "LKR"            // Currency
       req.orderId = "ABCDWXYZ"        // Unique ID for your payment transaction
       req.itemsDescription = "1 Greeting Card"    // Item title or Order/Invoice number
       req.custom1 = "This is the custom 1 message"
       req.custom2 = "This is the custom 2 message"

       let customer = Customer()

       customer.firstName = "Saman"
       customer.lastName = "Perera"
       customer.email = "samanp@gmail.com"
       customer.phone = "+94771234567"

       let address = Address()
       address.address = "No 43, Galle Road"
       address.city = "Colombo"
       address.country = "Sri Lanka"

       let deliverAddress = Address()
       deliverAddress.address = "No 1, Galle Road"
       deliverAddress.city = "Colombo"
       deliverAddress.country = "Sri Lanka"

       customer.address = address
       customer.deliveryAddress = deliverAddress

       req.customer = customer

    //   req.items = [Item(id: "1", name: "Card", quantity: 1)]
         
         let phVC = PHViewController()
         phVC.initRequest = req
         phVC.delegate = self
         phVC.isSandBoxEnabled = true
         phVC.modalPresentationStyle = .overCurrentContext
         
      //    self.present(phVC, animated: true, completion: nil)
    
    
    DispatchQueue.main.async {
      callback([NSNull() ,resultsDict])
   self.present(phVC, animated: true, completion: nil)
    }
   
    
   
    


    
  }
}
extension Payhere : PHViewControllerDelegate{
    func onErrorReceived(error: Error) {
        print("fff")
    }
    
    func onResponseReceived(response: PHResponse<Any>?) {
        if(response?.isSuccess())!{
           
            //Payment Success
        }else{
            response?.getMessage()
        }
    }
}
