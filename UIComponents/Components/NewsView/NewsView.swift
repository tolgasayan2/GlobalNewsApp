//
//  NewsView.swift
//  UIComponents
//
//  Created by Tolga Sayan on 20.07.2023.
//

import Foundation
import UIKit

public final class NewsView: UIView {

  @IBOutlet weak var headerLabel: UILabel!
  
  @IBOutlet weak var infoLabel: UILabel!
  
  public var viewModel: NewsViewModel? {
    didSet {
      guard let viewModel = viewModel else {
        isHidden = true
        return
      }
      initView(viewModel: viewModel)
    }
  }
  
  private func initView(viewModel: NewsViewModel) {
    self.headerLabel.text = viewModel.headerLabel
    if let infoLabel = viewModel.infoLabel {
      self.infoLabel.text = infoLabel
    }
  }
}
