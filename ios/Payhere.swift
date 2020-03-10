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

  @objc
  func payOnece(_ amount:NSInteger) {
  
  
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

  req.items = [Item(id: "1", name: "Card", quantity: 1)]
   
    let phVC = PHViewController()
  DispatchQueue.main.async {
       let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
       alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
     }
    
    
//phVC.initRequest = req
//phVC.delegate = self
//phVC.isSandBoxEnabled = true
//phVC.modalPresentationStyle = .overCurrentContext

self.present(phVC, animated: true, completion: nil)
  }
  @objc
  static func requiresMainQueueSetup() -> Bool {  return true}
}
extension UIApplication {

  class func topMostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

    if let navigationController = controller as? UINavigationController {
      return topMostViewController(controller: navigationController.visibleViewController)
    }

    if let tabController = controller as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topMostViewController(controller: selected)
      }
    }

    if let presented = controller?.presentedViewController {
      return topMostViewController(controller: presented)
    }

    return controller
  }
}
