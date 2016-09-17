//
//  NoteTableViewCell.swift
//  CustomListView
//
//  Created by ComVis on 9/14/16.
//  Copyright © 2016 ComVis. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var noteImageView: UIImageView!
    @IBOutlet weak var contentLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
