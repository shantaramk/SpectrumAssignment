//
//  MovieViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit
import Foundation

class CompanyViewController: AbstractViewController {
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK:- Properties
    
    var viewModel = CompanyViewModel()
    var isAssedingOrder: Bool = false {
        didSet {
            sortByOrder(order: isAssedingOrder)
            self.tableView.reloadData()
        }
    }
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callCompanyListAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }
    
    @objc override func rightBarButtonClicked() {
        self.isAssedingOrder.toggle()
    }
    
}


extension CompanyViewController {
    
    func loadMemberViews(using data: [Members]) {
        
        let detailView = AppStoryboard.main.instantiateVC(viewControllerClass: CompanyMemberViewController.self)
        
        detailView.viewModel.memberList = data
        
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func sortByOrder(order isAssending : Bool) {
        
        if isAssending {
            self.viewModel.searchedCompanies = self.viewModel.companyList.sortAssendingOrder()
            
        } else {
            self.viewModel.searchedCompanies = self.viewModel.companyList.sortDeAssendingOrder()
            
        }
    }
    
}

//MARK:- WebServies

extension CompanyViewController {
    
    @objc func followButtonClicked(_ button : UIButton) {
        
        self.viewModel.searchedCompanies[button.tag].isfollwing.toggle()
        self.tableView.reloadRows(at: [IndexPath.init(row: button.tag, section: 0)], with: .automatic)
    }
    
    @objc func favoriteButtonClicked(_ button : UIButton) {
        self.viewModel.searchedCompanies[button.tag].isfavorite.toggle()
        self.tableView.reloadRows(at: [IndexPath.init(row: button.tag, section: 0)], with: .automatic)
    }
    
    @objc func viewMemberButtonClicked(_ button : UIButton) {
        loadMemberViews(using: self.viewModel.searchedCompanies[button.tag].members ?? [])
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
