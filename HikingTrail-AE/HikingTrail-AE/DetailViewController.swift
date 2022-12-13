//
//  DetailViewController.swift
//  HikingTrail-AE
//
//  Created by user227538 on 11/9/22.
//

import Foundation
import UIKit
import WebKit

class DetailViewController : UIViewController {
    
    
    @IBOutlet weak var lblTrailName: UILabel!
    
    
    @IBOutlet weak var wkBrowser: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTrailName.text = passedHikingTrail.TrailName
        
        let siteURL = URL(string: passedHikingTrail.TrailWebSite)
        let request = URLRequest(url:siteURL!)
        wkBrowser.load(request)
    }
    
    var passedHikingTrail = HikingTrail()
    
}
