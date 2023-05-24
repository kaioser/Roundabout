//
//  Routable.swift
//  Roundabout
//
//  Created by 杨雄凯 on 2023/5/24.
//

import UIKit

public protocol RouterParable {}
extension String: RouterParable {}
extension Int: RouterParable {}
extension Array: RouterParable {}
extension Dictionary: RouterParable {}

public protocol Routable: UIViewController {
    
    associatedtype CustomParaType: RouterParable
    
    static func routeURL() -> String
        
//    static func routeParaType() -> CustomParaType.Type

    init(para: CustomParaType)
        
    func routeMode() -> RouteMode
}

public extension Routable {
    
    func routeMode() -> RouteMode { .push }
}

public enum RouteMode {
    
    case modal(presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle)
    
    case push
}

//public protocol RoutableAir: Routable {
//    associatedtype CustomParaType = String
//}
//
//public extension RoutableAir {
//    init(para: CustomParaType) { self.init() }
//}

// MARK: - Test Code

// 有参路由
class TestController: UIViewController, Routable {
    
    required convenience init(para: String) {
        self.init()

        self.id = para
    }
    
    typealias CustomParaType = String
    
    private var id: String = ""
    
    static func routeURL() -> String { "TestController" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("传过来的id=\(id)")
    }
}

// 无参路由
//class TestController2: UIViewController {}
//extension TestController2: RoutableAir {
//    static func routeURL() -> String {
//        ""
//    }
//}

class TestManager {
    
    func test() {
        
        let t = TestController.self
        
        let vc = t.init(para: "")
        print(vc)
    }
}
