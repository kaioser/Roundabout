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
    
    struct Row {
        var title: String
        var urlString: String
        var parameter: String?
    }
    
    private let data: [Row] = [Row(title: "商品列表", urlString: "TestController"),
                               Row(title: "商品详情", urlString: kProductDetailsRoute, parameter: "商品id"),
                               Row(title: "支付页面", urlString: kProducPayRoute, parameter: "订单id")]
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath)
        let item = data[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.parameter == nil ? "无参" : "有参"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = data[indexPath.row]
        RouterManager.shared.open(item.urlString)
    }
}

fileprivate class NormalCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// 路由静态列表
let kProductListRoute = "native://product/list"
let kProductDetailsRoute = "native://product/details"
let kProducPayRoute = "native://product/pay"
