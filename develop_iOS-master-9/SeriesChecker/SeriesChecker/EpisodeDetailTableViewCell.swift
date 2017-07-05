//
//  EpisodeDetailTableViewCell.swift
//  SeriesChecker
//
//  Created by Gabriel Castrillon on 03/07/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class EpisodeDetailTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var epNumber: UILabel!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var titleEpisode: UILabel!
    @IBOutlet weak var imgEpisode: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
