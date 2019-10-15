//
//  FirstViewController.swift
//  day05
//
//  Created by jasmine DE-AGRELA on 2019/10/14.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit
import MapKit

private let reuseIdentifier = "LocationCell"

class FirstViewController: UITableViewController {

    var dataToPass: String = ""
    var pinLocations: [CustomPin] = [
        CustomPin(pinTitle: "WeThinkCode_ Cape Town", pinSubTitle: "Cape Town Campus", location: CLLocationCoordinate2D(latitude: -33.9071, longitude: 18.4173), pinType: "Education"),//33.907077,18.4151217
        CustomPin(pinTitle: "Cape of Good Hope", pinSubTitle: "Tip of the Cape Peninsula", location: CLLocationCoordinate2D(latitude: -34.3567, longitude: 18.4702), pinType: "Nature"),
        CustomPin(pinTitle: "Kirstenbosch National Botanical Garden", pinSubTitle: "Hillside garden & nature reserve with rare plant species", location: CLLocationCoordinate2D(latitude: -33.9875, longitude: 18.4305), pinType: "Nature"),
        CustomPin(pinTitle: "Robben Island", pinSubTitle: "Historical landmark known for housing political prisoners", location: CLLocationCoordinate2D(latitude: -33.8047, longitude: 18.3523), pinType: "Historical"),
        CustomPin(pinTitle: "Netcare Christiaan Barnard Memorial Hospital", pinSubTitle: "General Hospital", location: CLLocationCoordinate2D(latitude: -33.9177, longitude: 18.4284), pinType: "Medical")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(LocationCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.tableView.alwaysBounceVertical = true
        self.tableView.reloadData()
        let tabbar = tabBarController as! BaseTabBarViewController
        tabbar.pinnedLocations = self.pinLocations
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pinLocations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationCell
        cell.name = pinLocations[indexPath.row].title!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let row = indexPath.row
        dataToPass = pinLocations[indexPath.row].title!
        let tabbar = tabBarController as! BaseTabBarViewController
        tabbar.selectedLocation = dataToPass
        tabbar.selectedPin = pinLocations[indexPath.row]
        tabBarController!.selectedIndex = 1
//        performSegue(withIdentifier: "mappingView", sender: row)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "mappingView" {
//            let vc = segue.destination as! SecondViewController
//            vc.selectedLocation = dataToPass
//        }
//    }
}

