//
//  MovieCellTableViewCell.swift
//  SeriesChecker
//
//  Created by LAB CCET on 12/06/17.
//  Copyright © 2017 Patati. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell
{
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    init(ImageView: UIImageView, movieTitleLabel: UILabel, synopsisLabel: UILabel)
//    {
//        super.init(frame: UITableViewController)
//        self.ImageView       =  ImageView
//        self.movieTitleLabel =  movieTitleLabel
//        self.synopsisLabel   =  synopsisLabel
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
