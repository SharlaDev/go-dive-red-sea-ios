//
//  CustomCell.swift
//  Go Dive Red Sea
//
//  Created by user on 09.12.17.
//  Copyright © 2017 Sara Divers. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var labelProgramm: UILabel!
    
    var subArrays = [Array<String>]()
    var arrayWithDescriptionAndPhoto = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
