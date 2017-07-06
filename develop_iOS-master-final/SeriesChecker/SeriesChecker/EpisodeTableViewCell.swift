//
//  EpisodeTableViewCell.swift
//  SeriesChecker
//
//  Created by Gabriel Castrillon on 01/07/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var epNumberLabel: UILabel!
    @IBOutlet weak var epTitleLabel: UILabel!    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
