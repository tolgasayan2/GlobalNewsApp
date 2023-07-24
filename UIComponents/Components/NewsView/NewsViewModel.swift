//
//  NewsViewModel.swift
//  UIComponents
//
//  Created by Tolga Sayan on 20.07.2023.
//

import Foundation

public struct NewsViewModel {
  
  let headerLabel: String
  let infoLabel: String?
  let categoryLabel: String?
  
  public init(headerLabel: String,
              infoLabel: String?,
              categoryLabel: String?) {
    self.headerLabel = headerLabel
    self.infoLabel = infoLabel
    self.categoryLabel = categoryLabel
  }
}
