//
//  ViewController.swift
//  day07
//
//  Created by jasmine DE-AGRELA on 2019/10/17.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit
import RecastAI

class ViewController: UIViewController {

    @IBOutlet weak var recastButton: UIButton!
    
    let bot = RecastAIClient(token: "c4bba4ece1d139943e1d1ea630219ddb", language: "en")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Loaded")
    }
    
    
    @IBAction func recastButtonPressed(_ sender: UIButton) {
        makeRequest()
    }
    
    func makeRequest() {
        self.bot.textRequest("What'll be the weather in London next Thursday?", successHandler: recastRequestDone(_:), failureHandle: recastRequestFailed(_:))
        
    }
    
    func recastRequestDone(_ response : Response)
    {
        let location = response.get(entity: "location")
        print(location!["latitude"])
    }
    
    func recastRequestFailed(_ error: Error)
    {
        print("Failed \(error)")
    }
}

