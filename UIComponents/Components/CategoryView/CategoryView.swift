//
//  CategoryView.swift
//  UIComponents
//
//  Created by Tolga Sayan on 23.07.2023.
//

import Foundation
import UIKit

public final class CategoryView: UIView {
  
  let nibName = "CategoryView"
  
  @IBOutlet var contentView: UIView!
  
  @IBOutlet private weak var categoryButton: UIButton!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    xibSetUp()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    xibSetUp()
  }
  
  private func xibSetUp() {
    contentView = loadViewFromNib()
    contentView.layer.backgroundColor = UIColor.black.cgColor
  }
  
  func loadViewFromNib() -> UIView {
    
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: nibName, bundle: bundle)
    if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
      return view
    }
    return UIView()
  }
  
  public var viewModel: CategoryViewModel? {
    didSet {
      guard let viewModel = viewModel else {
        isHidden = true
        return
      }
      initView(viewModel: viewModel)
    }
  }
  
  private func initView(viewModel: CategoryViewModel) {
    if let categoryLabel = viewModel.categoryLabel {
      self.categoryButton.titleLabel?.text = categoryLabel
    }
  }
  @IBAction func categoryButtonClick(_ sender: Any) {
  
  }
}
