//
//  CommonDefine.swift
//  arTest
//
//  Created by li jia on 2022/3/1.
//

import Foundation
import UIKit

let kScreenWidth = CGFloat(UIScreen.main.bounds.width)
let kScreenHeight = CGFloat(UIScreen.main.bounds.height)

//状态了高度
var kStatusBarHeight = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0

//是否全面屏
var isFullScreen: Bool {
    if #available(iOS 11, *) {
          guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
              return false
          }
          
          if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
              return true
          }
    }
    return false
}

//底部安全高度
var kFringeBottomArea: CGFloat {
    return isFullScreen ? 34.0 : 0.0
}

//顶部安全高度
var kFringeTopArea: CGFloat {
    return isFullScreen ? 24.0 : 0.0
}

//tabbar高度
var kTabBarHeight: CGFloat {
    return isFullScreen ? 83.0 : 49.0
}

//导航栏高度
var kNavigationBarHeight: CGFloat {
    return isFullScreen ? 88.0 : 64.0
}

//present时，顶部的高度
let PresentModalTopHeight: CGFloat = 40

//判断是否模拟器
let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
