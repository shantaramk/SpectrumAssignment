//
//  CompanyInfoCell.swift
//  CodableDemo
//
//  Created by Shantaram K on 17/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CompanyInfoCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pictureView: ImageLoader!
    @IBOutlet weak var titlaLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var memberButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = .none
    }
 
     var company: CompanyModel? {
         didSet {
             setData()
         }
     }
   
     func setData() {
         
         if let company = company {
             
             self.pictureView.loadImageWithUrl(URL(string: company.logo ?? "")!)
             
             self.titlaLabel.text = company.name ?? ""
             
             self.linkLabel.text = company.website ?? ""

             self.descriptionLabel.text = company.about ?? ""

         }
         
     }
     
     
}
