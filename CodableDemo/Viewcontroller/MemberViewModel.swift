//
//  MemberViewModel.swift
//  CodableDemo
//
//  Created by Shantaram K on 20/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class MemberViewModel: NSObject {
    
    var memberList = [Members]()
    var searchedmembers: [Members] = [Members]()
  
    var actionList: [(SortOption, UIAlertAction.Style)] {
          
          get {
              var actions: [(SortOption, UIAlertAction.Style)] = []
              
              actions.append((.nameAscending, UIAlertAction.Style.default))
              
              actions.append((.nameDescending, UIAlertAction.Style.default))
              
              actions.append((.ageAscending, UIAlertAction.Style.default))
              
              actions.append((.ageDescending, UIAlertAction.Style.default))
              
              return actions
          }
          
          
      }
    
}
