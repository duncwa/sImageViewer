//
//  PhotoViewCell.swift
//  sGenericAPITest
//
//  Created by Duncan Wallace on 3/9/16.
//  Copyright © 2016 Duncan Wallace. All rights reserved.
//

import UIKit

class PhotoViewCell: UITableViewCell {

  @IBOutlet weak var photoCount: UILabel!
  @IBOutlet var title: UILabel!
  @IBOutlet var photoImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
