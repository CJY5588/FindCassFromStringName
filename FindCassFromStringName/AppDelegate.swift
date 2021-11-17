//
//  AppDelegate.swift
//  FindCassFromStringName
//
//  Created by jianyi.chen on 2021/11/17.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        
        //类的名称
        let className = "NewClass"
        //根据"APP名称.类名称"查找对应的类
        let nsObjc = NSClassFromString(getAPPName() + "." + className) as! NSObject.Type
        //初始化类
        let objc = nsObjc.init()
        
        /* ******* 不需要传递参数，只执行类中的方法 ******* */
        
        // 将初始测试数据传递给测试类的testFunction方法
        let sel1 = NSSelectorFromString("testFunction")
        //判断类中的方法是否存在
        if (objc.responds(to: sel1)) {
            //执行类方法
            objc.perform(sel1)
        }
        
        /* ******* 传递参数，执行类中的方法 ******* */
        let sel2 = NSSelectorFromString("testFunction2:")
        //判断类中的方法是否存在
        if (objc.responds(to: sel2)) {
            //执行类方法
            objc.perform(sel2, with: "Hello World!")
        }
        
        /* ******* 执行类中的方法, 获取返回值 ******* */
        let sel3 = NSSelectorFromString("testFunction3")
        //判断类中的方法是否存在
        if (objc.responds(to: sel3)) {
            //执行类方法
           let resp:String = objc.perform(sel3).takeUnretainedValue() as! String
            print("return value:", resp)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func getAPPName() -> String {
        guard var appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String else { return "" }
       //如果工程名字中带有“-” 符号  需要加上 replacingOccurrences(of: "-", with: "_") 这句代码把“-” 替换掉  不然会报错, 要不然系统会自动替换掉 这样就不是你原来的包名了
        if appName.contains("-") {
            appName = appName.replacingOccurrences(of: "-", with: "_")
        }
        return appName
    }


}

