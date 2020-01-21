//
//  CompanyMemberViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CompanyMemberViewController: UIViewController {
    
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK:- Properties
    
    var viewModel = MemberViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
        viewModel.searchedmembers  = viewModel.memberList
        self.tableView.reloadData()
    }
                 
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Member List"
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
