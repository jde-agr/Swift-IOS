//
//  ViewController.swift
//  ex03
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

    var numScreen: Double = 0
    var prevNum: Double = 0
    var operation: Int = 0
    
    @IBAction func otherButtonTapped(_ sender: UIButton) {
        if (sender.tag >= 0 && sender.tag < 10) {
            displayLabel.text = displayLabel.text! + String(sender.tag)
            numScreen = Double(displayLabel.text!)!
        }
        if (sender.tag > 9) {
            if (displayLabel.text != "" && sender.tag != 10 && sender.tag != 16) {
                prevNum = Double(displayLabel.text!)!;
                operation = sender.tag
                print(operation)
                displayLabel.text = ""
                numScreen = 0
            }
            else if (sender.tag == 10) {
                switch operation {
                    case 11: displayLabel.text = String(prevNum + numScreen)
                    case 12: displayLabel.text = String(prevNum - numScreen)
                    case 13: displayLabel.text = String(prevNum * numScreen)
                case 14: if (numScreen == 0) {displayLabel.text = "Invalid Entry"} else {displayLabel.text = String(prevNum / numScreen)}
                    case 15: displayLabel.text = String(-1 * prevNum)
                    default: displayLabel.text = "Invalid Entry"
                }
            } else if (sender.tag == 16) {
                displayLabel.text = ""
                prevNum = 0
                numScreen = 0
                operation = 0
            }
        }
    }
}

