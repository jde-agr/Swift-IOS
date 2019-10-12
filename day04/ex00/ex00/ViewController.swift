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
    
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func butClick(_ sender: UIButton) {
        makeRequest(string: "school 42")
    }
    
    func makeRequest(string: String) {
            //insert code for twitter request
        let q = string.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let str = "https://api.twitter.com/1.1/search/tweets.json?q=\(q)&count=100&lang=en&result_type=recent"
            let url = URL(string: str)
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue("Bearer AAAAAAAAAAAAAAAAAAAAACxLAQEAAAAA3e1hR1XXxwMQx1lLTRgNKAD7UyM%3DsnmfkPJ0YZEF5TpFmQoWOTVSdnqXR7hoEYDvoI8Fy0uwY2E9in", forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                    }
                    if let data = data {
//                        print("data: \(dataString)")
                        let jData = try? JSONSerialization.jsonObject(with: data, options: [])
                        if let jData = jData as? [String: Any] {
//                            print(jData["statuses"]!)
                            var count = 0
                            for elem in jData["statuses"] as! NSArray {
                                print(elem)
                                count += 1
                            }
                            print("Number of results: \(count)")
                        }
                    }
                }
            }
            task.resume()
        }
}
