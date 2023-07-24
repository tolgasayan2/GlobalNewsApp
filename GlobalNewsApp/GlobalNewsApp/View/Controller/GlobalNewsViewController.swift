//
//  ViewController.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 20.07.2023.
//

import UIKit
import Common

protocol GlobalNewsDisplayLogic: AnyObject {
  func getNews(viewModel: Home.Dashboard.ViewModel)
}

final class GlobalNewsViewController: UIViewController {
  
  let tableView = UITableView()
  var viewModel: Home.Dashboard.ViewModel = .init(sections: [])
  let service: ServiceProvider = NewsService()
  var globalNewsViewModel: GlobalNewsViewModel!
  
   init() {
    super.init(nibName: nil, bundle: nil)
    self.globalNewsViewModel = GlobalNewsViewModel(newsService: service)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    globalNewsViewModel.viewController = self
    navigationItem.title = Home.Dashboard.title

    Task {
      configureTableView()
      try await globalNewsViewModel.fetchNews()
    }
  }

  //MARK: UITableView configuration
  private func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegates()
    tableView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    tableView.rowHeight = 90
    tableView.separatorStyle = .singleLine
    tableView.allowsSelection = false
    registerNibs()
    tableView.pin(to: view)
  }
  
  private func registerNibs() {
    tableView.register(GlobalNewsTableViewCell.self, forCellReuseIdentifier: GlobalNewsTableViewCell.identifier)
  }

  private func setTableViewDelegates() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

