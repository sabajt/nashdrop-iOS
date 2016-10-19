//
//  MaterialsVC.swift
//  Nashdrop
//
//  Created by Hunter Walker on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

protocol MaterialsDelegate: class {
    func updateWithFilteredMaterial(material: String?)
}

class MaterialsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var materialDelegate: MaterialsDelegate?
    
    var materials =  [
        "Plastic",
        "Cardboard",
        "Glass",
        "Brush",
        "Appliances",
        "Trash",
        "Metal",
        "Hazardous"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MaterialsVC: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let m = materials[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? MaterialCell
        cell?.materialLabel.text = m;
        
        return cell!
    }
}

extension MaterialsVC: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let m = materials[indexPath.row]
        var materialsMap = ["":""]
        
        if kUseGovAPI {
            materialsMap = [
                "Plastic" : "plastics_1_7",
                "Cardboard" : "cardboard_newspaper_mixed_paper",
                "Glass" : "glass_bottles_clear_green_brown",
                "Brush" : "residential_brush_leaves",
                "Appliances" : "residential_furniture_appliances",
                "Trash" : "residential_trash",
                "Metal" : "aluminum_metal_tin_cans",
                "Hazardous" : "household_hazardous_waste",
            ]
        } else {
            materialsMap = [
                "Plastic" : "plastic",
                "Cardboard" : "cardboard",
                "Glass" : "glass",
                "Brush" : "brush",
                "Appliances" : "appliances",
                "Trash" : "trash",
                "Metal" : "metal",
                "Hazardous" : "hazardous",
            ]
        }
        
        let queryParam = materialsMap[m]
    }
}

class MaterialCell: UITableViewCell {
    
    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
}
