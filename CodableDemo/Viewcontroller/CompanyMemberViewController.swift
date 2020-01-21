//
//  CompanyMemberViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CompanyMemberViewController: AbstractViewController {
    
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK:- Properties
    
    var viewModel = MemberViewModel()
    var isAssedingOrder: Bool = false {
           didSet {
               sortByOrder(order: isAssedingOrder)
               self.tableView.reloadData()
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        viewModel.searchedmembers  = viewModel.memberList
        self.tableView.reloadData()
    }
                 
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBarTitle("Member List")
    }

    @objc override func rightBarButtonClicked() {
           self.isAssedingOrder.toggle()
           addRightBarButtonWithImageAbstract(self.isAssedingOrder ? #imageLiteral(resourceName: "deassendind1") : #imageLiteral(resourceName: "assendind1"))
       }
    
    func sortByOrder(order isAssending : Bool) {
        
        if isAssending {           
            self.viewModel.searchedmembers = self.viewModel.memberList.sorted { first, second in
                let firstName = first.name?.first ?? ""
                let secondName = second.name?.first ?? ""
                return firstName < secondName
             }

        } else {
          self.viewModel.searchedmembers = self.viewModel.memberList.sorted { first, second in
             let firstName = first.name?.first ?? ""
             let secondName = second.name?.first ?? ""
             return firstName > secondName
          }
        }
    }
    
}

enum AppStoryboard: String {
    
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func instantiateVC<T: UIViewController>(viewControllerClass: T.Type) -> T {
        
        //let storyboardID = (viewControllerClass as UIViewController.Type).storyboard
        let storyboardID =  String(describing: viewControllerClass.self)
        
        guard let viewObj = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            //throw ExcpectedError.intantiationErro(msg:"ViewController with identifier \(storyboardID)")
            fatalError()
        }
        return viewObj
    }
    
}
