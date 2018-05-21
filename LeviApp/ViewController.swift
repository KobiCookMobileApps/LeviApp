//
//  ViewController.swift
//  LeviApp
//
//  Created by Admin on 5/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    
    @IBOutlet weak var webView: ProductWebView!
    
    let navigationDelegate = NavigationDelegate()
    let scriptHandler = ScriptMessageHandler()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scriptHandler.delegate = self
        
        webView.configure(nav: navigationDelegate, script: scriptHandler , homeURL: API.Products.home)
        
    }

}

extension ViewController: JavascriptHandlerDelegate {
    func received(product: Product) {
        
        let alertController = UIAlertController(
            title: "Enter Payment Information",
            message: "Credit Card Number",
            preferredStyle: .alert)
        
        let cancel = UIAlertAction(
            title: "Cancel",
            style: .default,
            handler: nil)
        
        let purchase = UIAlertAction(
            title: "Purchase",
            style: .default) { [unowned self] action in
                
                let textField = alertController.textFields![0]
                if textField.text?.count == 16 {
                    self.completePurchase(with: product)
                } else {
                    let alert = UIAlertController(title: "Invalid Credit Card", message: "Please Try Again", preferredStyle: .alert)
                    let cancel = UIAlertAction(title: "OK", style: .cancel)
                    
                    alert.addAction(cancel)
                    self.present(alert, animated: true, completion: nil)
                }
        }
        
        alertController.addTextField { textField in
            
            textField.delegate = self
        }
        alertController.addAction(purchase)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    func completePurchase(with product: Product) {
        guard let orderPage = Page.order else {
            return
        }
        
        webView.loadHTMLString(orderPage
            .replacingOccurrences(of: "{name}", with: product.name)
            .replacingOccurrences(of: "{price}", with: product.price)
            .replacingOccurrences(of: "{image}", with: product.image),
                               baseURL: nil)
        

    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowed = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowed.isSuperset(of: characterSet)
    }
    
    
}

