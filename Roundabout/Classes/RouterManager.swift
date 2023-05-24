//
//  RouterManager.swift
//  Roundabout
//
//  Created by 杨雄凯 on 2023/5/24.
//

import Foundation

public class RouterManager {
    
    public static let shared = RouterManager()
    private init() {}
    
    private lazy var registerClasses: [Routable.Type] = {
        
        var res: [Routable.Type] = []
        
        let expectedClassCount = objc_getClassList(nil, 0)
        let allClasses = UnsafeMutablePointer<AnyClass>.allocate(capacity: Int(expectedClassCount))
        let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
        let actualClassCount: Int32 = objc_getClassList(autoreleasingAllClasses, expectedClassCount)
        
        for i in 0 ..< actualClassCount {
            let currentClass: AnyClass = allClasses[Int(i)]
            
            if let cls = currentClass as? Routable.Type {
                print("路由控制器：\(type(of: cls))")
                
                res.append(cls)
            }
        }
        
        return res
    }()
    
    public func openURL(_ string: String) {
        
        let vc = registerClasses.filter { $0.init().routeURL() == string }
        
        print(vc)
    }
}
