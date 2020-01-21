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
    
    
       func addLeftNavigationBarBackButtonWithImage() {
           
           let leftNavigationBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"),
                                                       style: .plain,
                                                       target: self,
                                                       action: #selector(leftNavigationBarButtonClicked(_:)))
           self.navigationItem.leftBarButtonItem = leftNavigationBarItem
       }
    
    @objc func leftNavigationBarButtonClicked(_ sender: AnyObject) {
           /* do something with left navigation button action */
           self.navigationController?.popViewController(animated: true)
       }
    
    func setNavigationBarTitle(_ titleText: String) {
        let navigationBar: UINavigationBar! =  self.navigationController?.navigationBar
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
        self.title = titleText
        self.navigationController?.navigationBar.isHidden = false
    }

}
