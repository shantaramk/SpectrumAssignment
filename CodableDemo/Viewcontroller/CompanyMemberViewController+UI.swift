//
//  CompanyMemberViewController+UI.swift
//  CodableDemo
//
//  Created by Shantaram K on 20/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

let c = {
    return ""
}

extension CompanyMemberViewController {
    
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
        addRightBarButtonWithImageAbstract(#imageLiteral(resourceName: "assendind1"))
        addLeftNavigationBarBackButtonWithImage()
    }
    
    func setupTableview() {
        tableView.register(UINib(nibName: "MemberCell", bundle: nil), forCellReuseIdentifier: "MemberCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorColor = .gray
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
    func initializeTextFields() {
        
        searchTextField.delegate = self
        
        searchTextField.placeholder = "Search Member..."
        
        searchTextField.addTarget(self, action: #selector(searchCompanyCode(_:)), for: .editingChanged)
        
        searchTextField.clearButtonMode = .always
        
    }
}
