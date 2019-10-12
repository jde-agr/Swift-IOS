//
//  TableViewController.swift
//  Tweety
//
//  Created by Ryan DE KWAADSTENIET on 2019/10/12.
//  Copyright © 2019 Ryan DE KWAADSTENIET. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TweetyCell"
private let token = "AAAAAAAAAAAAAAAAAAAAACxLAQEAAAAA3e1hR1XXxwMQx1lLTRgNKAD7UyM%3DsnmfkPJ0YZEF5TpFmQoWOTVSdnqXR7hoEYDvoI8Fy0uwY2E9in"

class TableViewController: UITableViewController, APITwitterDelegate {
    func ear(tweet: [Tweet]) {
        DispatchQueue.main.async {
            self.data = tweet
            print(self.data)
            self.tableView.reloadData()
        }
    }
    
    func exception(err: NSError) {
        print("Errrrr")
    }
    
    var data = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //data = [Tweet(name: "Tweet", tweet: "A whole lot of text", date: "12 . 10 . 2019"),
        //Tweet(name: "Tweet", tweet: "A whole lot of text", date: "13 . 10 . 2019"),
        //Tweet(name: "Tweet", tweet: "A whole lot of text", date: "14 . 10 . 2019")]
        
        self.tableView.register(TweetyCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.alwaysBounceVertical = true
        
        let api = APIController(delegate: self, token: token)
        api.tweetBirdiesTweet(query: "cat")
        
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TweetyCell
        
        cell.name = data[indexPath.row].name
        cell.tweet = data[indexPath.row].tweet
        cell.date = data[indexPath.row].date
        
        return cell
    }

}
