//
//  ViewController.swift
//  ex01
//
//  Created by jasmine DE-AGRELA on 2019/10/08.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var txt = "";
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func clickMeTapped(_ sender: Any) {
        print("Hello World !")
        if (txt == "") {
            txt = "Hello World !"
        }
        else {
            txt = ""
        }
        textLabel.text = txt
    }
}

