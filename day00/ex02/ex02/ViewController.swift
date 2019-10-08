//
//  ViewController.swift
//  ex02
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

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func otherButtonTapped(_ sender: UIButton) {
//        print(sender.tag)
        var txt:String = ""
        if (sender.tag >= 0 && sender.tag < 10) {
            displayLabel.text = String(sender.tag)
            txt = "Button " + String(sender.tag) + " was selected."
        }
        else if (sender.tag > 9) {
            if (sender.tag == 10) {txt = "Button Equals was selected."}
            if (sender.tag == 11) {txt = "Button Plus was selected."}
            if (sender.tag == 12) {txt = "Button Minus was selected."}
            if (sender.tag == 13) {txt = "Button Multiply was selected."}
            if (sender.tag == 14) {txt = "Button Divide was selected."}
            if (sender.tag == 15) {txt = "Button Negate was selected."}
            if (sender.tag == 16) {txt = "Button AC was selected."}
        }
        if (!txt.isEmpty) {print(txt)}
    }
}

