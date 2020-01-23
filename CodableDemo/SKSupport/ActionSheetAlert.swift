//
//  ActionSheetAlert.swift
//  CodableDemo
//
//  Created by Shantaram K on 21/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit


class Alert {
    
    static func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(SortOption, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for (index, (title, style)) in actions.enumerated() {
            
            let alertAction = UIAlertAction(title: title.rawValue, style: style) { (_) in
                
                completion(index)
            }
            
            alertViewController.addAction(alertAction)
        }
        
        viewController.present(alertViewController, animated: true, completion: nil)
        
    }
}
