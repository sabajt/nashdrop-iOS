//
//  ViewController.swift
//  Nashdrop
//
//  Created by John Saba on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var centers = [RecycleCenter]()
    var selectedCenter: RecycleCenter? = nil

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tbc = tabBarController {
            tbc.delegate = self
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        updateWithFilteredMaterial(nil)
    }
    
    @IBAction func pickMaterial(sender: UIBarButtonItem) {

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMaterials" {
            if let vc = segue.destinationViewController as? MaterialsVC {
                vc.materialDelegate = self
            }
        }
    }
    
    func updateCenters(json: [[String: AnyObject]]) {
        
        centers = [RecycleCenter]()
        for center in json {
            let c = RecycleCenter(jsonDictionary: center)
            self.centers.append(c)
        }
        tableView.reloadData()
        
        NSNotificationCenter.defaultCenter().postNotificationName(NashDropNotifications.CentersUpdated, object: centers, userInfo: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centers.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let center = centers[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if let recycleCell = cell as? CentersCellTableViewCell {
            recycleCell.configureRecyclyingCenter(center)
        } else {
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let center = centers[indexPath.row]
        let vc = DetailTableViewController()
        vc.recycleCenter = center
        navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchController: MaterialsDelegate {
    
    func updateWithFilteredMaterial(material: String?) {
        
        // TODO: Make an adapter or the client generic.
        if kUseGovAPI {
            APIClient.sharedInstance.getCenters(material) { (errorMessage, json) in
                if let e = errorMessage {
                    print("Error fetching: \(e)")
                } else {
                    self.updateCenters(json!)
                }
            }
        } else {
            CustomAPIClient.sharedInstance.getCenters(material){ (errorMessage, json) in
                if let e = errorMessage {
                    print("Error fetching: \(e)")
                } else {
                    self.updateCenters(json!)
                }
            }
        }
    }
}

extension SearchController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        
        if let mapVC = viewController as? MainMapViewController {
            mapVC.delegate = self
        }
        
        return true
    }
}

extension SearchController: MapViewControllerDelegate {
    
    func fetchedCenters() -> [RecycleCenter] {
        return centers
    }
}
