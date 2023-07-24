//
//  Source.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 22.07.2023.
//

import Foundation

// MARK: - User
struct News: Codable {
  let status: String?
  let sources: [Source]?
}

// MARK: - Source
struct Source: Codable {
  let id, name, description: String?
  let url: String?
  let category: Category?
  let language, country: String?
}

enum Category: String, Codable, CaseIterable {
  case general = "general"
  case business = "business"
  case technology = "technology"
  case entertainment = "entertainment"
  case health = "health"
  case science = "science"
  case sports = "sports"
}
