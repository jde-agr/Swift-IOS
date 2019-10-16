//
//  ViewController.swift
//  day06
//
//  Created by jasmine DE-AGRELA on 2019/10/15.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision = UICollisionBehavior()
    var bounce = UIDynamicItemBehavior()
    var shapes: [Shape] = []
    var theShape: Shape? = nil;
    
    @IBOutlet var tadaMan: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.isUserInteractionEnabled = true
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        let panG = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture))
        let pinchG = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        let rotateG = UIRotationGestureRecognizer(target: self, action: #selector(self.rotateGesture))
        
        view.addGestureRecognizer(tapG)
        view.addGestureRecognizer(panG)
        view.addGestureRecognizer(pinchG)
        view.addGestureRecognizer(rotateG)
        print("Loaded")
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior()
    }

    @objc func tapGesture(_sender: UITapGestureRecognizer) {
        let shape = Shape(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        print(shape)
        shapes.append(shape)
        shape.translatesAutoresizingMaskIntoConstraints = true
        print("Touched")
        shape.center = _sender.location(in: self.view)
        view.addSubview(shape)

        collision.addItem(shape)
        gravity.addItem(shape)
        bounce.addItem(shape)

        collision.translatesReferenceBoundsIntoBoundary = true
        bounce.elasticity = 0.8
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        animator.addBehavior(bounce)
        
        // Old way, not correct but hey, it worked initially
        //        if gravity != nil {
        //            animator.removeBehavior(gravity)
        //            animator.removeBehavior(collision)
        //            animator.removeBehavior(bounce)
        //        }
        //        gravity = UIGravityBehavior(items: shapes)
        //        collision = UICollisionBehavior(items: shapes)
        //        bounce = UIDynamicItemBehavior(items: shapes)
    }
    
    @objc func panGesture(_sender: UIPanGestureRecognizer) {
        switch _sender.state {
        case .began:
            print("Panning")
            let originLocation = _sender.location(in: self.view)
            for shape in shapes {
                if (shape.layer.presentation()?.frame.contains(originLocation))! {
                    print("found")
                    theShape = shape
                    break
                    
                }
            }
            if theShape != nil {
                self.view.bringSubviewToFront(theShape!)
                gravity.removeItem(theShape!)
            }
        case .changed:
//            print("changing")
            if theShape != nil {
                theShape!.center = _sender.location(in: self.view)
                animator.updateItem(usingCurrentState: theShape!)
            }
        case .ended:
            print("Panning done")
        default:
            if theShape != nil {
                gravity.addItem(theShape!)
                theShape = nil
            }
        }
    }
    
    @objc func pinchGesture(_sender: UIPinchGestureRecognizer) {
        var lastScale: CGFloat = 1
        switch _sender.state {
        case .began:
            print("Pinching")
            let originLocation = _sender.location(in: self.view)
            for shape in shapes {
                if (shape.layer.presentation()?.frame.contains(originLocation))! {
                    print("found")
                    theShape = shape
                    break
                    
                }
            }
            if theShape != nil {
                gravity.removeItem(theShape!)
                self.view.bringSubviewToFront(theShape!)
                lastScale = _sender.scale
                print("scale \(theShape?.bounds)")
            }
        case .changed:
            //            print("changing")
            if theShape != nil {
                collision.removeItem(theShape!)
                theShape!.bounds.size = CGSize(width: 100*(_sender.scale/lastScale), height: 100*(_sender.scale/lastScale))
                if theShape!.type == "Circle" {
                    theShape?.layer.cornerRadius = 100*(_sender.scale/lastScale)/2
                }
                animator.updateItem(usingCurrentState: theShape!)
                collision.addItem(theShape!)
            }
        case .ended:
            print("Pinching done")
        default:
            if theShape != nil {
                gravity.addItem(theShape!)
                theShape = nil
            }
        }
    }
    
    @objc func rotateGesture(_sender: UIRotationGestureRecognizer) {
        var lastScale: CGFloat = 1
        switch _sender.state {
        case .began:
            print("Rotating")
            let originLocation = _sender.location(in: self.view)
            for shape in shapes {
                if (shape.layer.presentation()?.frame.contains(originLocation))! {
                    print("found")
                    theShape = shape
                    break
                    
                }
            }
            if theShape != nil {
                gravity.removeItem(theShape!)
                self.view.bringSubviewToFront(theShape!)
            }
        case .changed:
            //            print("changing")
            if theShape != nil {
                theShape!.transform = theShape!.transform.rotated(by: _sender.rotation)
                animator.updateItem(usingCurrentState: theShape!)
                _sender.rotation = 0
            }
        case .ended:
            print("Rotating done")
        default:
            if theShape != nil {
                gravity.addItem(theShape!)
                theShape = nil
            }
        }
    }
}

