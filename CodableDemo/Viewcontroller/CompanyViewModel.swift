//
//  MovieViewModel.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit
enum SortOption: String {
    case nameAscending = "Name by Ascending Order"
    case nameDescending = "Name by Descending Order"
    case ageAscending = "age by Ascending Order"
    case ageDescending = "age by Descending Order"

}

class CompanyViewModel: NSObject {
    
    var companyList = [CompanyModel]()
    var searchedCompanies: [CompanyModel] = [CompanyModel]()
    
    var actionList: [(SortOption, UIAlertAction.Style)] {
        
        get {
            var actions: [(SortOption, UIAlertAction.Style)] = []
            
            actions.append((.nameAscending, UIAlertAction.Style.default))
            
            actions.append((.nameDescending, UIAlertAction.Style.default))
            
            return actions
        }
        
        
    }
    
 

}
