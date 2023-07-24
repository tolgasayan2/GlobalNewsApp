//
//  GlobalNewsTableViewCell.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 20.07.2023.
//


import UIKit
import UIComponents

class GlobalNewsTableViewCell: UITableViewCell {
  
  static let identifier = "GlobalNewsTableViewCell"
  
  
  var collectionView: UICollectionView!
  var categories: [String] = []
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    guard let newsView = newsView else {
      return
    }
    
    self.contentView.addSubview(newsView)
    newsView.pin(to: contentView)
  }
  
  var newsView: NewsView? {
    didSet {
      guard let newsView = newsView else {
        return
      }
      self.newsView = newsView
      awakeFromNib()
    }
  }
  
  //MARK: CollectionView
  func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .clear
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(GlobalNewsCollectionViewCell.self, forCellWithReuseIdentifier: GlobalNewsCollectionViewCell.identifier)
    self.contentView.addSubview(collectionView)
    collectionView.pin(to: self)
    for category in Category.allCases {
      categories.append(category.rawValue.capitalized)
    }
    awakeFromNib()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("tolga")
  }
}
