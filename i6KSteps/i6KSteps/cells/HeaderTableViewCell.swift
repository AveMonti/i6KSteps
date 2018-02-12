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
    @IBOutlet weak var circleView: UIView!
    var circle = ProgressCircle()
    @IBOutlet weak var todaysStepCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.gifImageHeader.loadGif(name: "forest")
        circle = ProgressCircle(view: circleView)
        circle.setup(loadFromBegin: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCircle(progressValue: Float){
        circle.update(currentValue: progressValue)
    }

}
