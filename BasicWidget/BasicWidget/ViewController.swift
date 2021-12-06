//
//  ViewController.swift
//  BasicWidget
//
//  Created by Fernando Daniel Mateo Ramos on 22/11/21.
//

import UIKit
import WidgetKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetWidget(_ sender: UIButton) {
        WidgetCenter.shared.reloadAllTimelines()
    }
}

