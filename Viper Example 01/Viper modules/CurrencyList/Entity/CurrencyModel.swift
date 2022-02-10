//
//  CurrencyModel.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

struct Currency: Decodable {
    let id: String
    let name: String
    let price: String
    let logo_url: String
}

