//
//  ReadByTableViewCell.swift
//  WhatsAppDemo
//
//  Created by Sneha Harke on 04/06/19.
//  Copyright © 2019 Sneha Harke. All rights reserved.
//

import UIKit

class ReadByTableViewCell: UITableViewCell {

    @IBOutlet weak var readerImageView: UIImageView!
    @IBOutlet weak var readLabel: UILabel!
    @IBOutlet weak var deliveredLabel: UILabel!
    @IBOutlet weak var readTimeLabel: UILabel!
    @IBOutlet weak var deliveredTimeLabel: UILabel!
    @IBOutlet weak var readTimeLeadingConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        readerImageView.layer.cornerRadius = readerImageView.frame.width/2
        readLabel.isHidden = true
        deliveredLabel.isHidden = true
        readTimeLabel.isHidden = false
        deliveredTimeLabel.isHidden = true
    }

    // Configure the view for the selected state
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true {
            readTimeLeadingConstraint.constant = 140
            readLabel.isHidden = false
            deliveredLabel.isHidden = false
            readTimeLabel.isHidden = false
            deliveredTimeLabel.isHidden = false
        } else {
            readTimeLeadingConstraint.constant = 10
            readLabel.isHidden = true
            deliveredLabel.isHidden = true
            readTimeLabel.isHidden = false
            deliveredTimeLabel.isHidden = true
        }
    }
    
}
