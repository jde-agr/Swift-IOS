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
    @IBOutlet weak var inputWeather: UITextField!
    @IBOutlet weak var outputWeather: UILabel!
    
    let bot = RecastAIClient(token: "c4bba4ece1d139943e1d1ea630219ddb", language: "en")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Loaded")
    }
    
    
    @IBAction func recastButtonPressed(_ sender: UIButton) {
        if (inputWeather.text != "") {
            makeRequest(weather: inputWeather.text!)
        } else {
            outputWeather.text = "Invalid input for weather"
        }
    }
    
    //inputWeather: String
    func makeRequest(weather: String) {
        self.bot.textRequest(weather, successHandler: recastRequestDone(_:), failureHandle: recastRequestFailed(_:))
        
    }
    
    func recastRequestDone(_ response : Response)
    {
        var toPrint: String = ""
        let datetime = response.get(entity: "datetime")
        let location = response.get(entity: "location")
        print("Stuff \(response)")
//        outputWeather.text = location!["city"] as! String
        if (datetime != nil) {
            let formatted = datetime!["formatted"] as! String
            toPrint += "\(formatted)"
        }
        if (location != nil) {
            toPrint += "\n\(location!["city"] as! String)"
        }
        if toPrint == "" {
            toPrint = "No data available"
        }
        outputWeather.text = toPrint
    }
    
    func recastRequestFailed(_ error: Error)
    {
        print("Failed \(error)")
    }
}

