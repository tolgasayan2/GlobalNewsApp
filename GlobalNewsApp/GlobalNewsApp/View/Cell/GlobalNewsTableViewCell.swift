//
//  GlobalNewsTableViewCell.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 20.07.2023.
//

import Foundation
import UIKit
import UIComponents

class GlobalNewsTableViewCell: UITableViewCell {
  
  static let identifier = "GlobalNewsTableViewCell"
  
  public override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  var newsView: NewsView? {
    didSet {
      guard let newsView = newsView else {
        return
      }
      configureNewsView(newsView: newsView)
    }
  }
  
  private func configureNewsView(newsView: NewsView) {
      addSubview(newsView)
      newsView.pin(to: self)
  }
  
}
