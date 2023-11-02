//
//  TableView.swift
//  UIViewRepresentable
//
//  Created by 김건우 on 11/2/23.
//

import UIKit
import SwiftUI

struct TableView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UITableViewController {
        let controller = UITableViewController()
        controller.tableView.delegate = context.coordinator
        controller.tableView.dataSource = context.coordinator
        
        controller.tableView.allowsSelection = false
        controller.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    func makeCoordinator() -> TableViewCoordinator {
        return TableViewCoordinator()
    }
    
}

final class TableViewCoordinator: NSObject { }

extension TableViewCoordinator: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Random Number"
    }
}

extension TableViewCoordinator: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    
}
