//
//  HeaderTableViewCell.swift
//  i6KSteps
//
//  Created by Mateusz Chojnacki on 12.02.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var gifImageHeader: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.gifImageHeader.loadGif(name: "forest")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
