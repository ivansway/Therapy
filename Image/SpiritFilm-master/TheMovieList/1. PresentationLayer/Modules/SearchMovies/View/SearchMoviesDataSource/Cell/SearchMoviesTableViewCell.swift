//
//  SearchMoviesTableViewCell.swift
//  TheMovieList
//
//  Created by Загид Гусейнов on 27.08.2019.
//  Copyright © 2019 zagid. All rights reserved.
//

import UIKit

class SearchMoviesTableViewCell: UITableViewCell {
    @IBOutlet weak var moviesImage: UIImageView!
    @IBOutlet weak var nameMoviesLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.moviesImage.layer.cornerRadius = moviesImage.frame.width / 2
        self.moviesImage.clipsToBounds = true
    }

   
}
