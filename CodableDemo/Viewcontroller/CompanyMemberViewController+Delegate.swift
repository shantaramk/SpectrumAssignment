//
//  CompanyMemberViewController+Delegate.swift
//  CodableDemo
//
//  Created by Shantaram K on 20/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit


// MARK: - UITableView Delegate and Datasource Methods


extension CompanyMemberViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.searchedmembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? MemberCell else {fatalError("Unable to find Appropriate TableViewCell")}
        
        cell.member = self.viewModel.searchedmembers[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

// MARK: - UI TextField Delegate Methods
extension CompanyMemberViewController: UITextFieldDelegate {
    
    private func searchCompanyCode(withCountryName name: String) {
        let name = name.trimmingCharacters(in: .whitespaces)
        self.viewModel.searchedmembers =  self.viewModel.memberList.filter({ (company) -> Bool in
            let fullName = "\(company.name?.first! ?? "") \(String(describing: company.name?.last!))"
            let companyName = fullName.lowercased()
            return companyName.contains(name.lowercased())
        })

    }

    @objc func searchCompanyCode(_ textField: UITextField) {
        
        guard let query = textField.text else { return }
        
        if query.count == 0 {
            self.viewModel.searchedmembers = self.viewModel.memberList
        } else {
            if query.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil {
            } else {
                self.searchCompanyCode(withCountryName: query)
            }
        }
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .search && textField.text!.count > 0 {
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.viewModel.searchedmembers = self.viewModel.memberList
        tableView.reloadData()
        return true
    }
    
}

extension CompanyMemberViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.searchTextField.resignFirstResponder()
    }
}
