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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let recycleCenter = recycleCenter {
            title = recycleCenter.name
        }
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
            cell.textLabel?.text = "Name"
            cell.detailTextLabel?.text = recycleCenter.name
            return cell

        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Address"
            cell.detailTextLabel?.text = recycleCenter.address
            return cell

        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "City"
            cell.detailTextLabel?.text = recycleCenter.city
            return cell

        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "State"
            cell.detailTextLabel?.text = recycleCenter.state
            return cell

        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "ZIP"
            cell.detailTextLabel?.text = recycleCenter.zip
            return cell

        case 5:
            let cell = tableView.dequeueReusableCellWithIdentifier("headerCell", forIndexPath: indexPath)
            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = recycleCenter.phone
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