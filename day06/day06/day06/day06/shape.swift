//
//  shape.swift
//  day06
//
//  Created by jasmine DE-AGRELA on 2019/10/15.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class Shape: UIView {
    var type: String = "Rectangle"
    var col: UIDynamicItemCollisionBoundsType = .rectangle
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
//        bounds = CGRect(x: 50, y: 50, width: 1000, height: 1000)
        if Int.random(in: 0...1) == 0 {
            type = "Circle"
            layer.cornerRadius = 100 / 2
            col = .ellipse
        }
        switch Int.random(in: 0..<4) {
        case 0:
            backgroundColor = UIColor.red
        case 1:
            backgroundColor = UIColor.orange
        case 2:
            backgroundColor = UIColor.yellow
        case 3:
            backgroundColor = UIColor.green
        default:
            backgroundColor = UIColor.blue
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return col
    }
    
}
