//
//  HUD.swift
//  SwiftTestbed
//
//  Created by firefly on 2021/1/28.
//

import Foundation
import UIKit
import MBProgressHUD

/// 状态指示器
/// 可显示在window上，可显示在指定的view上
/// 对于显示结果的hud，文字不宜过长，否则很丑。(待优化)
/// 要在主线中操作：显示、切换、隐藏
class HUD {
    
    // 文本类的hud在父视图上的位置
    enum Position {
        case top // 在顶部
        case middle // 在中间
        case bottom // 在底部
    }
        
    //MARK: - 显示指示器
    @discardableResult
    static func showIndicator(message: String = "")  -> MBProgressHUD {
        let window = UIApplication.shared.windows.last
        let hud = showIndicator(message: message, in: window!)
        
        return hud
    }
    
    @discardableResult
    static func showIndicator(message: String = "", in view: UIView) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        
        hud.label.text = message
        hud.isSquare = true
        
        // dim
        hud.backgroundView.style = .solidColor
        hud.backgroundView.color = UIColor(white: 0, alpha: 0.1)
        
        // 隐藏时从父视图上移除
        hud.removeFromSuperViewOnHide = true;
        
        let indefinateView = SVIndefiniteAnimatedView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))

        indefinateView.strokeColor = .white;
        indefinateView.strokeThickness = 2
        indefinateView.radius = 20
                
        hud.customView = indefinateView
        
        // 文本颜色
        hud.contentColor = .white
        // 背景色
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black
        
        return hud
    }
    
    //MARK: - 让指示器消失
    static func hideIndicator(parentViewOrHud: UIView, animated: Bool = true) {
        var optionalHud: MBProgressHUD?
        if parentViewOrHud is MBProgressHUD {
            optionalHud = parentViewOrHud as? MBProgressHUD
        } else {
            optionalHud = MBProgressHUD.forView(parentViewOrHud)
        }
        
        guard let hud = optionalHud else {
            return
        }
        
        hud.hide(animated: animated)
    }
    
    // MARK: - 显示结果： 成功、失败、警告
    
    
    // MARK: 转换到结果视图
    static func switchToSuccess(text: String, for view: UIView, duration: TimeInterval = 3) {
        switchToResult(.success, text: text, for: view)
    }
    static func switchToFailure(text: String, for view: UIView, duration: TimeInterval = 3) {
        switchToResult(.failure, text: text, for: view)
    }
    static func switchToWaring(text: String, for view: UIView, duration: TimeInterval = 3) {
        switchToResult(.warning, text: text, for: view)
    }
    
    /// 从状态指示器切换到结果
    /// - parameter resultType: 结果类型：成功、失败、警告
    /// - parameter text: 提示信息
    /// - parameter for: 要切换的视图，可能是状态指示器的父视图，可可能是状态指示器本身
    /// - parameter duration: 切换后，结果视图显示的时间(单位为秒)，默认为3s

    static func switchToResult(_ resultType: ResultType, text: String, for view: UIView, duration: TimeInterval = 3) {
        
        var optionalHud: MBProgressHUD?
        if view is MBProgressHUD {
            optionalHud = view as? MBProgressHUD
        } else {
            optionalHud = MBProgressHUD.forView(view)
        }
        
        guard let hud = optionalHud else {
            return
        }
        // 切换模式
        hud.mode = .customView
        // 切换消息
        hud.label.text = text
        // 切换到指定的结果
        let image = HUD.resultImage(resultType)
        hud.customView = UIImageView(image: image)
        
        hud.hide(animated: true, afterDelay: duration)
    }
    
    // MARK: 显示在window上
    static func showSuccess(text: String, duration: TimeInterval = 3) {
        showResult(.success, text: text, duration: duration)
    }
    static func showFailure(text: String, duration: TimeInterval = 3) {
        showResult(.failure, text: text, duration: duration)
    }
    static func showWarning(text: String, duration: TimeInterval = 3) {
        showResult(.warning, text: text, duration: duration)
    }
    
    static func showResult(_ resultType: ResultType, text: String, duration: TimeInterval = 3) {
        guard let window = UIApplication.shared.windows.last else {
            return
        }
        showResult(resultType, text: text, in: window, duration: duration)
    }
    
    // MARK: 显示指定视图上
    static func showSuccess(text: String, in view: UIView, duration: TimeInterval = 3) {
        showResult(.success, text: text, in: view, duration: duration)
    }
    static func showFailure(text: String, in view: UIView, duration: TimeInterval = 3) {
        showResult(.failure, text: text, in: view, duration: duration)
    }
    static func showWarning(text: String, in view: UIView, duration: TimeInterval = 3) {
        showResult(.warning, text: text, in: view, duration: duration)
    }
    /*
     在指定视图上显示指定时间的指定文字和结果
     */
    enum ResultType {
        case success
        case failure
        case warning
    }
    static func showResult(_ resultType: ResultType, text: String, in view: UIView, duration: TimeInterval = 3) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        hud.label.text = text
        
        // 自定义视图
        let image = resultImage(resultType)
        hud.customView = UIImageView(image: image)
        
        // 保持正方形
//        hud.isSquare = true

        // 文本颜色
        hud.contentColor = .white
        // 背景色
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black
        
        hud.hide(animated: true, afterDelay: duration)
    }
    
    static func resultImage(_ resultType: ResultType) -> UIImage? {
        let image: UIImage?
        
        switch resultType {
        case .success:
            image = UIImage(named: "Checkmark")
        case .failure:
            image = UIImage(named: "error")
        case .warning:
            image = UIImage(named: "info")
        }
        
        return image?.withRenderingMode(.alwaysTemplate)
    }
    
    // MARK: - 显示提示文字
    // 在window指定的位置显示指定的时间
    static func showText(_ text: String, at position: Position = .bottom, duration: TimeInterval = 3) {
        guard let window = UIApplication.shared.windows.last else {
            return
        }
        showText(text, at: position, in: window, duration: duration)
    }
        
    static func showText(_ text: String, at position: Position = .bottom, in parentView: UIView, duration: TimeInterval = 3) {
        let hud = MBProgressHUD.showAdded(to: parentView, animated: true)
        hud.mode = .text
        hud.label.text = text
        
        // 显示位置
        let viewHeight = parentView.bounds.height
        let delta = viewHeight / 2 * 0.7
        
        let offsetY: CGFloat
        switch position {
        case .top:
            offsetY = -delta
        case .middle:
            offsetY = 0
        case .bottom:
            offsetY = delta
        }
        
        hud.offset = CGPoint(x: 0, y: offsetY)

        // 文本颜色
        hud.contentColor = .white
        // 背景色
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black
        
        hud.margin = 10 // 调整提hud的高度
        
        hud.hide(animated: true, afterDelay: duration)
    }
}
