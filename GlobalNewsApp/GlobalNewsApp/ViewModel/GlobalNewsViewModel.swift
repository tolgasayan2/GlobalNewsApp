//
//  GlobalNewsViewModel.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 22.07.2023.
//

import Foundation
import UIComponents

protocol GlobalNewsViewModelDataStore {
  var news: News? { get set }
}

protocol GlobalNewsViewModelDisplayLogic {
  func fetchNews() async throws
  
}

class GlobalNewsViewModel: GlobalNewsViewModelDisplayLogic {
  
  var news: News?
  var sections: [Home.Dashboard.Section] = []
  var viewModel = Home.Dashboard.ViewModel.init(sections: [])
  var newsService: ServiceProvider
  weak var viewController: GlobalNewsDisplayLogic?
  
  init(newsService: ServiceProvider) {
    self.newsService = newsService
  }
  
  func fetchNews() async throws {
    guard let url = URL(string: BaseUrl.base.rawValue + BaseUrl.apiKey.rawValue) else {
      return
    }
    
    do {
      news = try await newsService.getNews(url: url)
      
      guard let news = news else {
        return
      }
      presentDashboard(news: news)
    }
    catch {
      dump(String(describing: error))
    }
  }
  
  private func presentDashboard(news: News) {
    guard let sources = news.sources else {
      return
    }
    
    sources.forEach { source in
      if let name = source.name,
         let description = source.description,
         let category = source.category {
        let newsViewModel = NewsViewModel(headerLabel: name, infoLabel: description, categoryLabel: category.rawValue)
        let viewModel = Home.NewsView.ViewModel(newsViewModel: newsViewModel)
        sections.append(.newsView(viewModel: viewModel))
      }
    }
    viewModel.sections = sections
    viewController?.getNews(viewModel: viewModel)
  }
}
