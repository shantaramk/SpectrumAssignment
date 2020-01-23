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
    var sortOption: SortOption = .nameAscending

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
        Alert.showActionsheet(viewController: self, title: "Sort", message: "Please the select Option", actions: viewModel.actionList) { (index) in
            print("call action \(index)")
            self.filter(for: self.viewModel.actionList[index].0)
            self.tableView.reloadData()
        }
        
    }
    
    func sortNameByOrder(order isAssending : Bool) {
        
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
    
    func sortAgeByOrder(order isAssending : Bool) {
        
        
        if isAssending {
            self.viewModel.searchedmembers = self.viewModel.memberList.sorted { first, second in
                let firstName = first.age ?? 0
                let secondName = second.age ?? 0
                return firstName < secondName
            }
            
        } else {
            self.viewModel.searchedmembers = self.viewModel.memberList.sorted { first, second in
                let firstName = first.age ?? 0
                let secondName = second.age ?? 0
                return firstName > secondName
            }
        }
    }
    
}

extension CompanyMemberViewController {
    
    func filter(for option: SortOption) {
        
        self.sortOption = option
        
        switch option {
            
        case .nameAscending:
            
            sortNameByOrder(order: true)
            
        case .nameDescending:
            
            sortNameByOrder(order: false)
            
        case .ageAscending:
            
            sortAgeByOrder(order: true)
            
        case .ageDescending:
            
            sortAgeByOrder(order: false)
            
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
