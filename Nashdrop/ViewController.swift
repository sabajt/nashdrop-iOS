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
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        APIClient.sharedInstance.getCenters { (errorMessage, json) in
            
            self.centers = [RecycleCenter]()
            
            for center in json! {
                
                let c = RecycleCenter(jsonDictionary: center)
                self.centers.append(c)
                
                
            }
            
            self.tableView.reloadData()
//            print(self.centers)
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

