//
//  StatesTableViewController.swift
//  swift-solving-trivia-table-view-lab
//
//  Created by Flatiron School on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class StatesTableViewController: UITableViewController {
    
    let statesAndCapitals = [
        "Alabama":"Montgomery",
        "Alaska":"Juneau",
        "Arizona":"Phoenix",
        "Arkansas":"Little Rock",
        "California":"Sacramento",
        "Colorado":"Denver",
        "Connecticut":"Hartford",
        "Delaware":"Dover",
        "Florida":"Tallahassee",
        "Georgia":"Atlanta",
        "Hawaii":"Honolulu",
        "Idaho":"Boise",
        "Illinois":"Springfield",
        "Indiana":"Indianapolis",
        "Iowa":"Des Moines",
        "Kansas":"Topeka",
        "Kentucky":"Frankfort",
        "Lousiana":"Baton Rouge",
        "Maine":"Augusta",
        "Maryland":"Annapolis",
        "Massassachusetts":"Boston",
        "Michigan":"Lansing",
        "Minnesota":"Saint Paul",
        "Mississippi":"Jackson",
        "Missouri":"Jefferson City",
        "Montana":"Helena",
        "Nebraska":"Lincoln",
        "Nevada":"Carson City",
        "New Hampshire":"Concord",
        "New Jersey":"Trenton",
        "New Mexico":"Santa Fe",
        "New York":"Albany",
        "North Carolina":"Raleigh",
        "North Dakota":"Bismarck",
        "Ohio":"Columbus",
        "Oklahoma":"Oklahoma City",
        "Oregon":"Salem",
        "Pennsylvania":"Harrisburg",
        "Rhode Island":"Providence",
        "South Carolina":"Columbia",
        "South Dakota":"Pierre",
        "Tennessee":"Nashville",
        "Texas":"Austin",
        "Utah":"Salt Lake City",
        "Vermont":"Montpelier",
        "Virgina":"Richmond",
        "Washington":"Olympia",
        "West Virginia":"Charleston",
        "Wisconsin":"Madison",
        "Wyoming":"Cheyenne"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statesAndCapitals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)
        
        let sortedStates = statesAndCapitals.keys.sort()
        
        cell.textLabel?.text = sortedStates[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let state = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text {
            
            var alertMessage: String
            
            if lettersAreShared(state) {
                alertMessage = "No dice, broski!"
            } else {
                alertMessage = "Winner winner, chicken dinner!"
            }
            
            let alertController = UIAlertController.init(title: "Result", message: alertMessage, preferredStyle: .Alert)
            let action = UIAlertAction(title: "okay gake", style: .Cancel) { (action) in
                
            }
            
            alertController.addAction(action)
            
            self.presentViewController(alertController, animated: true) {
                print("alert presented. neato!")
            }
        }
    }
    
    func lettersAreShared(state: String) -> Bool {
        
        if let capital = statesAndCapitals[state]{
            
            let stateSet = Set(state.lowercaseString.characters).sort()
            
            let capitalSet = Set(capital.lowercaseString.characters).sort()
            
            return (stateSet.map { capitalSet.contains($0) }).contains(true)
        }
        
        return false
    }
}
