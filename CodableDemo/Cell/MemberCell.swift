//
//  MemberCell.swift
//  CodableDemo
//
//  Created by Shantaram K on 20/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {

    // MARK: - IBOutlet
     
     @IBOutlet weak var titlaLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var member: Members? {
            didSet {
                setData()
            }
        }
      
        func setData() {
            
            if let member = member {
                self.titlaLabel.text =  (member.name?.first! ?? "") + " " +  (member.name?.last! ?? "")
                self.ageLabel.text =  "\(member.age!) Year Old"
                self.emailLabel.text =  member.email!
                self.phoneLabel.text =  member.phone!

            }
            
        }
}
