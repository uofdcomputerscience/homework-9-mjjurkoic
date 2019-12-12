//
//  ViewController.swift
//  UDAIRConnectivity
//
//  Created by Michael Jurkoic on 12/6/19.
//  Copyright © 2019 Michael Jurkoic. All rights reserved.
//
//  This app is a simple example of a use of the Reachability CocoaPod.
//  As the web host in target is a captive wifi login portal, I believe
//  this app can only be effectively tested from an iPhone, the
//  simulator won't be able to stand in for wifi connection testing.
//

import UIKit
import Reachability

class ViewController: UIViewController, ReachabilityObserverDelegate {
    
    @IBOutlet weak var connectivityLabel: UILabel!
    @IBOutlet weak var connectivityIndicator: UIActivityIndicatorView!
    
    let targetHost = "http://udair2.udallas.edu/cgi-bin/login"
    var reachability: Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectivityLabel.text = "Connection state"
        connectivityIndicator.startAnimating()
        addReachabilityObserver(hostname: targetHost)
    }
    
    func reachabilityChanged(_ isReachable: Bool) {
        if (isReachable) {
            connectivityLabel.text = "Reachable"
            connectivityIndicator.stopAnimating()
        } else {
            connectivityLabel.text = "Unreachable"
            connectivityIndicator.startAnimating()
        }
    }
    

}

