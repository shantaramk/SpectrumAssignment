//
//  MovieViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit
import Foundation

class CompanyViewController: UIViewController {
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK:- Properties
    
    var viewModel = CompanyViewModel()
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callCompanyListAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }
    
    
}

//MARK:- WebServies

extension CompanyViewController {
    
    @objc func followButtonClicked(_ button : UIButton) {
        
    }
    
    @objc func favoriteButtonClicked(_ button : UIButton) {
        
    }
    
    @objc func viewMemberButtonClicked(_ button : UIButton) {
        
    }
}

//MARK:- WebServies

extension CompanyViewController {
    
    func callCompanyListAPI() {
        
        CompanyProxy.companyList(APIConfiguration(),
                                 successCompletion: { (result) in
                                    
                                    self.viewModel.companyList = result
                                    self.viewModel.searchedCompanies = result
                                    self.tableView.reloadData()
                                    
        }) { (error) in
            
            print(error)
        }
    }
    
}
