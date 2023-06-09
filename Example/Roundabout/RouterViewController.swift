//
//  RouterViewController.swift
//  Roundabout_Example
//
//  Created by 杨雄凯 on 2023/5/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import Roundabout

// 商品列表
//class ProductListController: UIViewController, Routable {
//    
//    static func routeURL() -> String {
//        kProductListRoute
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemRed
//    }
//}

//// 商品详情
//class ProductDetailsController: UIViewController, Routable {
//    
//    struct TestPara: PageParameterizable {
//        var productId: String
//    }
//    
//    static func routePara() -> PageParameterizable? {
//        return TestPara(productId: "23984")
//    }
//    
//    static func routeURL() -> String {
//        kProductDetailsRoute
//    }
//    
//    func routeIntoMode() -> RouteIntoMode {
//        .push
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBlue
//    }
//}

// 商品支付
//class ProductPayController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemOrange
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("根据传来的orderId:\(String(describing: orderId))去请求支付信息....")
//    }
//
//    private var orderId: String!
//
//    init(_ orderId: String) {
//        super.init(nibName: nil, bundle: nil)
//        self.orderId = orderId
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension ProductPayController: Routable {
//
//    func routeURL() -> String {
//        kProducPayRoute
//    }
//
//    func routeIntoMode() -> RouteIntoMode {
//        .push
//    }
//
//    struct OrderInfo: PageParameterizable {
//        var orderId: String
//    }
//
//    func routePara() -> PageParameterizable? {
//        return OrderInfo(orderId: orderId)
//    }
//}
