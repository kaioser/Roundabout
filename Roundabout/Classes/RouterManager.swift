//
//  RouterManager.swift
//  Roundabout
//
//  Created by 杨雄凯 on 2023/5/24.
//

import Foundation
import Extension

public class RouterManager {
    
    public static let shared = RouterManager()
    private init() {}
    
    var routerClasses: [any Routable.Type] = []
    
    public func setup() {
        
        // 获取app中所有的类的数量
        let typeCount = Int(objc_getClassList(nil, 0))
        
        // 获取所有类
        let types = UnsafeMutablePointer<AnyClass>.allocate(capacity: typeCount)
        
        // 获取所有安全类
        let safeTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        
        // 获取真实存在的类
        let realTypeCount = objc_getClassList(safeTypes, Int32(typeCount))
        
        for index in 0 ..< realTypeCount {
            if let c = types[Int(index)] as? any Routable.Type {
                routerClasses.append(c)
                debugPrint("已添加路由: \(c.description())")
            }
        }
    }
    
    public func navigator(_ url: String, para: Any) {
        
        guard let realUrl = url.components(separatedBy: "?").first else {
            debugPrint("未找到合法的url")
            return
        }
        
        // 此处应该有scheme和host检测
        
//        open(realUrl)
    }
    
    public func open(_ url: String, sss: Any) {
        
        guard let type = routerClasses.filter({ $0.routeURL() == url }).first else {
            // 失败回调
            return
        }
        
        let t = type.routerController(sss)
        
        
//        let vc = type<RouterParable>.init(para: 1)
        
//        let vc = type.init(para: "")
//        UIViewController.current()?.navigationController?.pushViewController(vc, animated: true)
    }
}

extension Routable {
    
//    func navigator(_ url: String, para: CustomParaType) {
//
//        guard let type = RouterManager.shared.routerClasses.filter({ $0.routeURL() == url }).first else {
//            // 失败回调
//            return
//        }
//
//        let vc = type.init(para: para)
////        UIViewController.current()?.navigationController?.pushViewController(vc, animated: true)
//    }
}
