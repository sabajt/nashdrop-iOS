//
//  DetailTableViewController.swift
//  Nashdrop
//
//  Created by Paul Kirk Adams on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var recycleCenter: RecycleCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "nameCell")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "headerCell")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        guard let recycleCenter = recycleCenter else {
            return tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
        }

        switch indexPath.row {

        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            cell.textLabel?.text = recycleCenter.name
            return cell

        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Address: " + recycleCenter.address!
            return cell

        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "City: " + recycleCenter.city!
            return cell

        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "State: " + recycleCenter.state!
            return cell

        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "ZIP: " + recycleCenter.zip!
            return cell

        case 5:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Phone: " + recycleCenter.phone!
            return cell

        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell", forIndexPath: indexPath)
            return cell
        }
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        default:
            return 50
        }
    }
}