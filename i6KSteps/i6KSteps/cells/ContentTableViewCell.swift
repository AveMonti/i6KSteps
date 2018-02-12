//
//  ContentTableViewCell.swift
//  i6KSteps
//
//  Created by Mateusz Chojnacki on 12.02.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var circleView: UIView!
    
    var circle = ProgressCircle()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circle = ProgressCircle(view: circleView)
        circle.setup()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCircle(progressValue: Float){
        circle.update(currentValue: progressValue)
    }
    
    

}
