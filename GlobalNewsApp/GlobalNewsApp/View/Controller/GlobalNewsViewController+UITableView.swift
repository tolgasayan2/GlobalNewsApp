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
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: GlobalNewsTableViewCell.identifier, for: indexPath) as? GlobalNewsTableViewCell {
      let newsView = NewsView()
      newsView.viewModel = NewsViewModel(headerLabel: "tolga", infoLabel: "hadi yap bu işi")
      cell.newsView = newsView
      return cell
    }
    return UITableViewCell()
  }
}
