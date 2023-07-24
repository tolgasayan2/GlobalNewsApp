//
//  NewsService.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 22.07.2023.
//

import Foundation

enum BaseUrl: String {
  case base = "https://newsapi.org/v2/sources?apiKey="
  case apiKey = "eea94ffe6d4545f18f41042d4e8e27d4"
}

protocol ServiceProvider {
  func getNews(url: URL) async throws -> News
  func downloadImage(from url: URL) async throws -> Data
}
class NewsService: ServiceProvider {
  
  func getNews(url: URL) async throws -> News {
    let session = URLSession.shared
    let (data, _) = try await session.data(from: url)
    let decoder = JSONDecoder()
    return try decoder.decode(News.self, from: data)
  }
  
  func downloadImage(from url: URL) async throws -> Data {
    let session = URLSession.shared
    let (data, _) = try await session.data(from: url)
    return data
  }
}
