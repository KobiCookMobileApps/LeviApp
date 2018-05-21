//
//  ProductWebView.swift
//  LeviApp
//
//  Created by Admin on 5/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit




class ProductWebView: WKWebView {
    
    func configure(nav: WKNavigationDelegate, script: JavascriptHandler, homeURL: String) {
        
        // set navigation delegate (ie.. actions performed when clicking a link)
        navigationDelegate = nav
        
        //set script handler (ie. actions performed on button taps)
        configuration.userContentController.add(script, name: script.identifier)
        
        // load home page
        if let url = URL(string: homeURL) {
            
            let request = URLRequest(url: url)
            load(request)
        }
        
        
    }
    
}
