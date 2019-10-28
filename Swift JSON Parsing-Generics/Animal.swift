//
//  Animal.swift
//  Swift JSON Parsing-Generics
//
//  Created by shiga on 28/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import Foundation

struct Animal: Decodable {
    let name: String
    let description: String
    let maxWeightInLbs: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case maxWeightInLbs = "max_weight_lbs"
    }
}
