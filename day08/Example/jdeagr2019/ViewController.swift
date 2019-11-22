//
//  ViewController.swift
//  jdeagr2019
//
//  Created by jde-agr on 10/18/2019.
//  Copyright (c) 2019 jde-agr. All rights reserved.
//

import UIKit
import jdeagr2019

@available(iOS 10.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dem: Demo = Demo()
        dem.dispName(name: "Joe")
//        newArticle(title: "Mana", content: "It is our life force")
        let art: ArticleManager = ArticleManager()
        art.newArticle(title: "Mana", content: "It is our life force")
//        newArticle(
        print("Done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

