//
//  MaterialsVC.swift
//  Nashdrop
//
//  Created by Hunter Walker on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

class MaterialsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var materials =  ["Plastic", "Cardboard", "Glass", "Brush", "Appliances", "Trash", "Metal", "Haxardous", "Children" ]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let m = materials[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = m
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
