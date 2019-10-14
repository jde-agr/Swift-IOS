//
//  FirstViewController.swift
//  day05
//
//  Created by jasmine DE-AGRELA on 2019/10/14.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

private let reuseIdentifier = "LocationCell"

class FirstViewController: UITableViewController {
    
    var data: [String] = ["WeThinkCode_, Victoria & Alfred Waterfront, Cape Towndsadsaaasddasda", "Cape of Good Hope, Cape Peninsula, Cape Town", "Kirstenbosch National Botanical Garden"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(LocationCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.alwaysBounceVertical = true
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
        
        cell.name = data[indexPath.row]
//        cell.tweet = data[indexPath.row].tweet
//        cell.date = data[indexPath.row].date
        
        return cell
    }
}

