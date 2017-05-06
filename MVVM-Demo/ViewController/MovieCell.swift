//
//  MovieCell.swift
//  MVVM-Demo
//
//  Created by tembin on 2017/5/6.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  
  
  var model: MovieModel! {
    didSet {
      self.nameLabel.text = model.movieName
      self.yearLabel.text = model.year
      self.imgView.sd_setImage(with: URL(string: model.imageUrl))

    }
  }
		
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
