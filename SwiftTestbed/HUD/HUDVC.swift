//
//  HUDVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2021/1/28.
//

import Foundation
import MBProgressHUD

class HUDVC: BaseViewController {
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUI()
        configUI()
        addUI()
        constraintUI()
    }
    deinit {
        print("\(type(of: self)).\(#function)")
    }
    
    // MARK: - UI
    func creatUI() {
        
        let backItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(back))
        let showItem = UIBarButtonItem(title: "shw", style: .plain, target: self, action: #selector(showIndicator))
        let dismissItem = UIBarButtonItem(title: "dis", style: .plain, target: self, action: #selector(dismissIndicator))
        
        navigationItem.leftBarButtonItems = [backItem, showItem, dismissItem]
        
        let doneItem = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(showDone))
        let progressItem = UIBarButtonItem(title: "poges", style: .plain, target: self, action: #selector(showProgress))
        let failureItem = UIBarButtonItem(title: "fail", style: .plain, target: self, action: #selector(showFailure))
        let warningItem = UIBarButtonItem(title: "warn", style: .plain, target: self, action: #selector(showWarning))
        let switchItem = UIBarButtonItem(title: "swtich", style: .plain, target: self, action: #selector(swithToResult))

        
        navigationItem.rightBarButtonItems = [doneItem, progressItem, failureItem, warningItem, switchItem]

        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        btn.setTitle("test", for: .normal)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
        view.addSubview(btn)
        
        btn.backgroundColor = .gray
        
    }
    
    func configUI() {
        
    }
    func addUI() {
        
    }
    func constraintUI() {
        
    }
    
    // MARK: - action
    @objc func btnTapped() {
        print("\(type(of: self)).\(#function)")
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    @objc func showIndicator() {
        HUD.showIndicator(message: "正在登录", in: view)
    }
    @objc func dismissIndicator() {
        
        HUD.hideIndicator(parentViewOrHud: view)
        
    }
    @objc func showDone() {
        if let hud = MBProgressHUD.forView(view) {
            hud.mode = .customView
            hud.customView = UIImageView()
            
            let image = UIImage(named: "Checkmark")?.withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: image)
            hud.customView = imageView
            hud.label.text = "完成"
            
            hud.hide(animated: true, afterDelay: 3)
        } else {
            HUD.showSuccess(text: "修改成功")
        }
    }
    @objc func showProgress() {
    }
    @objc func showFailure() {
        HUD.showFailure(text: "服务器繁忙20")
    }
    @objc func showWarning() {
        HUD.showWarning(text: "密码不正确")
    }
    @objc func swithToResult() {
        HUD.switchToSuccess(text: "登录成功", for: view)
    }
     
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
//        HUD.showText("hello")
//        HUD.showText("hello", in:view)
        
//        let indefinateView = SVIndefiniteAnimatedView(frame: CGRect(x: 200, y: 150, width: 80, height: 80))
//        indefinateView.center = view.center
//        indefinateView.backgroundColor = UIColor.black
//
//        indefinateView.layer.cornerRadius = 6
//        indefinateView.layer.masksToBounds = true
//        indefinateView.strokeColor = .white;
//        indefinateView.strokeThickness = 3
//        indefinateView.radius = 30
//        view.addSubview(indefinateView)
    }
}

