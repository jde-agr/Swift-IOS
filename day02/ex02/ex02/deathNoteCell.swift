//
//  deathNoteCell.swift
//  ex01
//
//  Created by jasmine DE-AGRELA on 2019/10/09.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class deathNoteCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func setDeathNote(deathNote: DeathNote) {
        nameLabel.text = deathNote.name
        dateLabel.text = deathNote.date
        descLabel.text = deathNote.desc
        dateLabel.sizeToFit()
    }
}
