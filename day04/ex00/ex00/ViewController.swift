//
//  ViewController.swift
//  ex00
//
//  Created by jasmine DE-AGRELA on 2019/10/12.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

struct Tweet: CustomStringConvertible {
    var description: String
    
    let name: String
    let text: String
}

protocol APITwitterDelegate : class {
    func apiTwitter (name: [Tweet])
    func error(err: NSError)
}

class APIController {
    weak var delegate: APITwitterDelegate?
    let token: String
    
    init(delegate: APITwitterDelegate?, token: String) {
        self.delegate = delegate
        self.token = token
    }
    
    func makeRequest(string: String) {
        //insert code for twitter request
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

