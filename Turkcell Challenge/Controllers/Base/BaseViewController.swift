//
//  BaseViewController.swift
//  Turkcell Challenge
//
//  Created by Efe Helvacı on 24.12.2017.
//  Copyright © 2017 Efe Helvaci. All rights reserved.
//

import UIKit
import SwifterSwift
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    var backgroundColor: UIColor {
        return UIColor.white
    }
    
    lazy var activityIndicator : NVActivityIndicatorView = {
        var activityIndicator = NVActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 40.0, height: 40.0)),
                                                        type: .ballGridPulse,
                                                        color: UIColor.PrimaryBlueColor(withAlpha: 1.0),
                                                        padding: 0.0)
        
        
        activityIndicator.center = self.view.center
        activityIndicator.layer.zPosition = 1
        
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(activityIndicator)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
