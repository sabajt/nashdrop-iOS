//
//  CentersCellTableViewCell.swift
//  Nashdrop
//
//  Created by Hunter Walker on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

class CentersCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    var center: Center!
    
    
    func configureRecyclyingCenter(recycleDict: center) {
        if let number = recycleDict["1"] as? Dictionary<String, AnyObject> {
            if let name = number["name"] as? String {
                self.nameLbl.text = name
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
