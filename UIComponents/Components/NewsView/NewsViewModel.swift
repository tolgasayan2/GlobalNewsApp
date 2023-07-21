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
  
  public init(headerLabel: String,
              infoLabel: String?) {
    self.headerLabel = headerLabel
    self.infoLabel = infoLabel
  }
}
