//
//  MovieViewController+UI.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit

// MARK: - UI Methods

extension CompanyViewController {
    
    func configureUI() {
        configureNavigationBar()
        setupTableview()
        configureView()
        initializeTextFields()
    }
    
    func configureView() {
        
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "Companies"

    }
    
    func setupTableview() {
        tableView.register(UINib(nibName: "CompanyInfoCell", bundle: nil), forCellReuseIdentifier: "CompanyInfoCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorColor = .gray
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    func initializeTextFields() {
        
        searchTextField.delegate = self
        
        searchTextField.placeholder = "Search Company.."
        
        searchTextField.addTarget(self, action: #selector(searchCompanyCode(_:)), for: .editingChanged)
        
        searchTextField.clearButtonMode = .always
        
    }
}
