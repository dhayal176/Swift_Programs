//
//  DetailViewController.swift
//  Project 7-Petitions
//
//  Created by Dhayaalan Raju on 26/06/20.
//  Copyright © 2020 Dhayaalan Raju. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var detailItem: Petition?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name = "viewport" content = "width = device - width, initial-scale = 1">
        <style> body {font-size: 150% ; }
        </style>
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        webView.loadHTMLString(html, baseURL: nil)
        
        
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
