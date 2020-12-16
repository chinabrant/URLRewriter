//
//  ViewController.swift
//  URLRewriter
//
//  Created by chinabrant on 12/16/2020.
//  Copyright (c) 2020 chinabrant. All rights reserved.
//

import UIKit
import URLRewriter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rule = RewriteRule(pattern: "^(?:https?:)\\/\\/test.(com|test)\\/product\\/([0-9]*).html$", target: "myappScheme://host.mobile/goodsDetail?goodsId=$2")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

