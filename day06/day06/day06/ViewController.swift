//
//  ViewController.swift
//  day06
//
//  Created by jasmine DE-AGRELA on 2019/10/15.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator = UIDynamicAnimator()
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    let bounce = UIDynamicItemBehavior()
    
    @IBOutlet var tadaMan: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tadaMan.isUserInteractionEnabled = true
        let tapG = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        tadaMan.addGestureRecognizer(tapG)
        print("Loaded")
        animator = UIDynamicAnimator(referenceView: view)
        gravity.gravityDirection = CGVector(dx: 0, dy: 0.8)
        animator.addBehavior(gravity)
    }

    @objc func tapGesture(_sender: UITapGestureRecognizer) {
        let hh = shape(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        print(hh)
        hh.translatesAutoresizingMaskIntoConstraints = true
//        tadaMan.addSubview(hh)
        print("Touched")
        hh.center = _sender.location(in: self.view)
        print(_sender.view!.constraints)
        view.addSubview(hh)
    }
}

