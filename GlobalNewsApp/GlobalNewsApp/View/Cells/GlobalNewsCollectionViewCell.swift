//
//  GlobalNewsCollectionViewCell.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 23.07.2023.
//

import UIKit
import UIComponents

class GlobalNewsCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "GlobalNewsTableViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    guard let categoryView = categoryView else {
      return
    }
    self.contentView.addSubview(categoryView)
    categoryView.pin(to: contentView)
  }
  
  var categoryView: CategoryView? {
    didSet {
      guard let categoryView = categoryView else {
        return
      }
      self.categoryView = categoryView
      awakeFromNib()
    }
  }
}
