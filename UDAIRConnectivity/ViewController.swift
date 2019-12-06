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

class ViewController: UIViewController {
    
    @IBOutlet weak var connectivityLabel: UILabel!
    @IBOutlet weak var connectivityIndicator: UIActivityIndicatorView!
    
    let targetHost = "http://udair2.udallas.edu/cgi-bin/login"
    var reachability: Reachability?

    override func viewDidLoad() {
        super.viewDidLoad()
        connectivityLabel.text = "Unreachable"
        connectivityIndicator.startAnimating()
        setupReachability(hostName: targetHost)
    }

    func setupReachability(hostName: String) {
        self.reachability = try? Reachability(hostname: hostName)
        self.reachability?.whenReachable = { (reachability) in
            self.connectivityLabel.text = "Reachable"
            self.connectivityIndicator.stopAnimating()
        }
        self.reachability?.whenUnreachable = { (reachability) in
            self.connectivityLabel.text = "Unreachable"
            self.connectivityIndicator.startAnimating()
        }
    }

}

