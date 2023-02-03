//
//  Article.swift
//  Daily Bugle
//
//  Created by J Dayasagar on 18/01/23.
//


import Foundation

// MARK: - NewsAPI
struct NewsAPI: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable , Identifiable {
    let id = UUID()
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable{
    let id: String?
    let name: String?
}
