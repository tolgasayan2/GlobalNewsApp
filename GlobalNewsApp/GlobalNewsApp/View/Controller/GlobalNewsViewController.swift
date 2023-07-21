//
//  ViewController.swift
//  GlobalNewsApp
//
//  Created by Tolga Sayan on 20.07.2023.
//

import UIKit
import Common

final class GlobalNewsViewController: UIViewController {
  
  let tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }

  //MARK: UITableView configuration
  private func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegates()
    tableView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    tableView.rowHeight = 90
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

