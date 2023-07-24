//
//  GlobalNewsViewController+DisplayLogic.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 22.07.2023.
//

import Foundation

extension GlobalNewsViewController: GlobalNewsDisplayLogic {
  
  func getNews(viewModel: Home.Dashboard.ViewModel) {
    self.viewModel = viewModel
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }

}
