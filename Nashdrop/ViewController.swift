//
//  ViewController.swift
//  Nashdrop
//
//  Created by John Saba on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var centers = [Center]()

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dict1 = Center(dictionary: ["name":"Nashville1"])
        var dict2 = Center(dictionary: ["name":"Nashville2"])
        var dict3 = Center(dictionary: ["name":"Nashville3"])
        
        centers.append(dict1)
        centers.append(dict2)
        centers.append(dict3)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
 
        
        let center = centers[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? CentersCellTableViewCell {
            cell.configureRecyclyingCenter(["name":"Nahsville"])
            return cell
        } else {
          return CentersCellTableViewCell()
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}



class Center {
    
    private var _postName: String?
    
    var postName: String? {
        return _postName
    }
    
    init(dictionary: Dictionary<String,AnyObject>) {
        if let username = dictionary["name"] as? String {
            self._postName = username
        }
        
    }
    
    
}
