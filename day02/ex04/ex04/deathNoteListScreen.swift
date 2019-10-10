//
//  deathNoteListScreen.swift
//  ex01
//
//  Created by jasmine DE-AGRELA on 2019/10/09.
//  Copyright © 2019 jde-agr. All rights reserved.
//

import UIKit

class deathNoteListScreen: UIViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
    var deathNotes : [DeathNote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deathNotes = createDummyDeathNotes()
        // Do any additional setup after loading the view.
    }
    
    func createDummyDeathNotes() -> [DeathNote] {
        var tempDeathNotes : [DeathNote] = []
        
        let deathNote1 = DeathNote(name: "Dude1", date: "1 Mar 2019", desc: "Death by chocolate")
        let deathNote2 = DeathNote(name: "Dude2", date: "25 Jul 2019", desc: "Death by skills")
        let deathNote3 = DeathNote(name: "Dude3", date: "17 Aug 2019", desc: "Death by oppposites")
        
        tempDeathNotes.append(deathNote1)
        tempDeathNotes.append(deathNote2)
        tempDeathNotes.append(deathNote3)
        
        return tempDeathNotes
    }
    
    func addDeathNote(deathNote: DeathNote) {
        deathNotes.append(deathNote)
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
      
    }

    @IBAction func done(segue:UIStoryboardSegue) {
       let carDetailVC = segue.source as! addDeathNodeScreen
       if (carDetailVC.dNote != nil && carDetailVC.dNote!.name != "") {
            print(carDetailVC.dNote!.name)
            deathNotes.append(carDetailVC.dNote!)
            tbView.reloadData()
       } 
    }
}


extension deathNoteListScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deathNotes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deathNote = deathNotes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeathNoteCell") as! deathNoteCell
        cell.setDeathNote(deathNote: deathNote)
        let number = (indexPath.row % 2)
        let result = Bool(truncating: number as NSNumber)
        if(result) {
            cell.backgroundColor = .red
        }
        else {
            cell.backgroundColor = .green;
        }
        return cell
    }
}


