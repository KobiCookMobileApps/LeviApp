//
//  ScriptInjector.swift
//  LeviApp
//
//  Created by Admin on 5/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation



/// Used to inject custom scripts into mobile web pages
/// TODO: move this to an actual javascript file!
struct ScriptInjector {
    
    /// Product Scripts
    struct Product {
        
        /// Script for the Product Detail Page
        static let detailPage = View.payButton + Function.payButton
        
        /// View Manipulations
        private struct View {
            
            /// Pay Button Manipulation
            static let payButton = "document.getElementById('addToCartButton').innerText='Pay';"
        }
        
        /// Logic Functions
        private struct Function {
            
            /// When the pay button is pressed, pass product information to the iOS app
            

            static let payButton = ("""
                        document.getElementById('addToCartButton').addEventListener("click", function(){
                    
                            var data = {'name': document.getElementsByClassName('page-title')[0].innerText, 'price': document.getElementsByClassName('sale-price')[0].innerText, 'image': document.getElementsByClassName('product-image-first')[0].children[0].srcset };
                            try {
                                webkit.messageHandlers.ScriptMessageHandler.postMessage(data);
                            } catch(err) {
                            console.log('error');
                            }
                        });
                    """)
        
        }
        
    }
    
}



