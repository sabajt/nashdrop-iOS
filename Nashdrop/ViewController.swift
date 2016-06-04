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

    @IBOutlet weak var tableView: UITableView!
    
    func updateCenters(json: [[String: AnyObject]]) {
        
        if kUseGovAPI {
            centers = [RecycleCenter]()
            for center in json {
                let c = RecycleCenter(jsonDictionary: center)
                self.centers.append(c)
            }
            print("new array count: \(centers.count)")
            tableView.reloadData()
        } else {
            
            print("json: \(json)")
            // use custom recycle center
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        APIClient.sharedInstance.getCenters(nil) { (errorMessage, json) in
            if let e = errorMessage {
                print("Error fetching: \(e)")
            } else {
                self.updateCenters(json!)
            }
        }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SearchController: MaterialsDelegate {
    
    func updateWithFilteredMaterial(material: String) {
        
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