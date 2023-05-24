//
//  Routable.swift
//  Roundabout
//
//  Created by 杨雄凯 on 2023/5/24.
//

import UIKit

public protocol Routable: UIViewController {
    
    func routePara() -> PageParameterizable?
    
    func routeURL() -> String
    
    func routeIntoMode() -> RouteIntoMode
}

public extension Routable {
    func routePara() -> PageParameterizable? { nil }
}

public protocol PageParameterizable {}

public enum RouteIntoMode {
    
    case present(modalPresentationStyle: UIModalPresentationStyle, modalTransitionStyle: UIModalTransitionStyle)
    
    case push
}
