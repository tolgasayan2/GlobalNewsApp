//
//  GlobalNewsViewController+UITableView.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 20.07.2023.
//

import Foundation
import UIKit
import UIComponents

extension GlobalNewsViewController: UITableViewDelegate,
                                    UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(viewModel.sections.count)
    return viewModel.sections.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: GlobalNewsTableViewCell.identifier, for: indexPath) as? GlobalNewsTableViewCell {
    
  
      let section = self.viewModel.sections[indexPath.row]
      if indexPath.row == 0 {
        cell.setupCollectionView()
        return cell
      }
      else {
        switch section {
        case .newsView(let newsVM):
          cell.newsView?.removeFromSuperview()
          let newsView = NewsView()
          newsView.viewModel = newsVM.newsViewModel
          cell.newsView = newsView
          return cell
        }
      }
    }
    return UITableViewCell()
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      return
    }
  }
}
