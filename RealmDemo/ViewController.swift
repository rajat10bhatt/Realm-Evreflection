//
//  ViewController.swift
//  RealmDemo
//
//  Created by Rajat on 9/4/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: NSLayoutConstraint!
    
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        service.getJsonString()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

