//
//  NewsResponse.swift
//  class-task-m1w4d1
//
//  Created by Mac on 24/09/1446 AH.
//
import Foundation

struct NewsResponse: Decodable {
    let articles: [Article]
}
