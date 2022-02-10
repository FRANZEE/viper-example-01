//
//  NewsModel.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

struct NewsDetail: Decodable {
    let title: String
    let description: String
    let image: String
}

struct NewsList: Decodable {
    let data: [NewsDetail]
}
