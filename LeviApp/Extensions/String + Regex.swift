//
//  String + Regex.swift
//  LeviApp
//
//  Created by Admin on 5/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation




extension String {
    
    func matches(_ regex: String) -> Bool {
        let predicate = NSPredicate(format: "self MATCHES [c] %@", regex)
        let result = predicate.evaluate(with: self)
        return result
    }
}
