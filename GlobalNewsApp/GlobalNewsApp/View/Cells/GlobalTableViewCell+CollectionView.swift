//
//  GlobalTableViewCell+CollectionView.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 23.07.2023.
//

import Foundation
import UIKit
import UIComponents

extension GlobalNewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalNewsCollectionViewCell.identifier, for: indexPath) as? GlobalNewsCollectionViewCell {
      
      let categoryView = CategoryView()
      categoryView.viewModel = CategoryViewModel(categoryLabel: categories[indexPath.row])
      cell.categoryView = categoryView
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: 150, height: 160)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
  }
}
