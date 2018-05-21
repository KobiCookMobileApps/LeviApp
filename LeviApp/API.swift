//
//  API.swift
//  LeviApp
//
//  Created by Admin on 5/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation


struct API {
    
    struct Products {
        static let home = "https://www.levi.com/US/en_US/clothing/men/c/levi_clothing_men"
        
        static func isProductPage(_ url: String) -> Bool {
            let regex = "^.+" + "/jeans/" + ".+"
            return url.matches(regex)
        }
    
    }
    
    
    
}
