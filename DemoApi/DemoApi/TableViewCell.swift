//
//  TableViewCell.swift
//  DemoApi
//
//  Created by JENIL BHADJA on 08/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var vwHeader : UIView!{
        didSet{
            vwHeader.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var lblPostId : UILabel!
    @IBOutlet weak var lblId : UILabel!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblEmail : UILabel!
    @IBOutlet weak var lblBody : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

