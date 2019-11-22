//
//  LocationCell.swift
//  day05
//
//  Created by jasmine DE-AGRELA on 2019/10/14.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import Foundation
import UIKit

class LocationCell: UITableViewCell {

    var name: String?
    
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10) .isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        if let name = name {
            nameLabel.text = name
        }
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

}
