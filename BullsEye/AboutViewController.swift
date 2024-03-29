//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Abdulrahman Alkhatib on 14.09.2019.
//  Copyright © 2019 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController
{
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
