//
//  Home+Dashboard.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 22.07.2023.
//

import Foundation

extension Home.Dashboard {
  
  static let title = "Kaynaklar"
  
  struct ViewModel {
    var sections: [Home.Dashboard.Section]
    
    init(sections: [Home.Dashboard.Section]) {
      self.sections = sections
    }
  }
  
  enum Section {
    case newsView(viewModel: Home.NewsView.ViewModel)
  }
}
