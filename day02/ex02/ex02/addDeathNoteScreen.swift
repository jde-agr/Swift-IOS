//
//  addDeathNoteScreen.swift
//  ex02
//
//  Created by jasmine DE-AGRELA on 2019/10/10.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class addDeathNodeScreen: UIViewController {
    
    
    @IBOutlet weak var datePickerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        datePicker.minimumDate = date
        dateFormatter.dateStyle = DateFormatter.Style.medium
        datePickerLabel.text = dateFormatter.string(from: date)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
       dateFormatter.dateStyle = DateFormatter.Style.medium
       let strDate = dateFormatter.string(from: datePicker.date)
       datePickerLabel.text = strDate
    }
}
