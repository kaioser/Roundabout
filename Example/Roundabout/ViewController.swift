//
//  ViewController.swift
//  Roundabout
//
//  Created by yangxiongkai on 05/24/2023.
//  Copyright (c) 2023 yangxiongkai. All rights reserved.
//

import UIKit
import Roundabout

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "路由列表"
        tableView.register(NormalCell.self, forCellReuseIdentifier: "NormalCell")
    }
    
    private let data: [String] = [kProductListRoute, kProductDetailsRoute, kProducPayRoute]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        RouterManager.shared.openURL(data[indexPath.row])
    }
}

fileprivate class NormalCell: UITableViewCell {}

// 路由静态列表
let kProductListRoute = "native://product/list"
let kProductDetailsRoute = "native://product/details"
let kProducPayRoute = "native://product/pay"
