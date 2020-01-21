//
//  AbstractViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 17/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

     public func addRightBarButtonWithImageAbstract(_ buttonImage: UIImage) {
          let rightButton: UIBarButtonItem = UIBarButtonItem(image: buttonImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.rightBarButtonClicked))
          navigationItem.rightBarButtonItem = rightButton
      }
      
    @objc func rightBarButtonClicked() {
       }
    

}
