//
//  DimPresentationVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2021/1/16.
//

import Foundation
import UIKit

class DimPresentationVC: UIPresentationController {
    
    var dimmingView: UIView = {
        let view = UIView(frame: CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    public override var frameOfPresentedViewInContainerView: CGRect {
        
        let width = UIScreen.main.bounds.width - 2 * 24
        let height = width / 327 * 287

        let y = UIScreen.main.bounds.height * 0.4 - height / 2
        let frame = CGRect(x: 24, y: y, width: width, height: height)
        
        return frame
    }
    
    override func presentationTransitionWillBegin() {
        print("\(type(of: self)).\(#function)")
        self.containerView?.addSubview(dimmingView)
        dimmingView.addSubview(self.presentedViewController.view)
        
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        dimmingView.alpha = 0
        transitionCoordinator?.animate(alongsideTransition: { (content) in
            self.dimmingView.alpha = 1
        }, completion: { (context) in
            print("dimmingView alpha = 1")
        })
    }
    override func presentationTransitionDidEnd(_ completed: Bool) {
        print("\(type(of: self)).\(#function)")
    }
    
    override func dismissalTransitionWillBegin() {
        print("\(type(of: self)).\(#function)")
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        dimmingView.alpha = 1
        transitionCoordinator?.animate(alongsideTransition: { (content) in
            self.dimmingView.alpha = 0
        }, completion: { (context) in
            print("dimmingView alpha = 0")
        })
    }
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        print("\(type(of: self)).\(#function)")
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    deinit {
        print("\(type(of: self)).\(#function)")
    }
}
