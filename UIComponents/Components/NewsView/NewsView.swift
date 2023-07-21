//
//  NewsView.swift
//  UIComponents
//
//  Created by Tolga Sayan on 20.07.2023.
//

import Foundation
import UIKit

public final class NewsView: UIView {
  
  @IBOutlet private weak var headerLabel: UILabel!
  @IBOutlet private weak var infoLabel: UILabel!
  @IBOutlet private weak var contentView : UIView!
  
  let nibName = "NewsView"
  
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    xibSetUp()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    xibSetUp()
  }
  
  func xibSetUp() {
    contentView = loadViewFromNib()
    contentView.frame = self.bounds
    contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
    addSubview(contentView)
  }
  
  func loadViewFromNib() -> UIView {
    
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    return nib.instantiate(withOwner: self, options: nil).first as! UIView
    
  }
  
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
