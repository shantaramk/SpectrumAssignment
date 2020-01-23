//
//  MovieViewController+UITableView.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit

// MARK: - UITableView Delegate and Datasource Methods


extension CompanyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.searchedCompanies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyInfoCell", for: indexPath) as? CompanyInfoCell else {fatalError("Unable to find Appropriate TableViewCell")}
        
        cell.company = self.viewModel.searchedCompanies[indexPath.row]
        
        cell.followButton.tag = indexPath.row
        
        cell.favoriteButton.tag = indexPath.row
        
        cell.memberButton.tag = indexPath.row
        
        cell.followButton.addTarget(self, action: #selector(followButtonClicked(_:)), for: .touchUpInside)
        
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonClicked(_:)), for: .touchUpInside)
        
        cell.memberButton.addTarget(self, action: #selector(viewMemberButtonClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let trandform3D = CATransform3DTranslate(CATransform3DIdentity, 0, 90, 0)
        
        cell.layer.transform = trandform3D
        
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

// MARK: - UI TextField Delegate Methods
extension CompanyViewController: UITextFieldDelegate {
    
    private func searchCompanyCode(withCountryName name: String) {
        let name = name.trimmingCharacters(in: .whitespaces)
        self.viewModel.searchedCompanies =  self.viewModel.companyList.filter({ (company) -> Bool in
            let companyName = company.name!.lowercased()
            return companyName.contains(name.lowercased())
        })

    }

    @objc func searchCompanyCode(_ textField: UITextField) {
        
        guard let query = textField.text else { return }
        
        if query.count == 0 {
            self.viewModel.searchedCompanies = self.viewModel.companyList
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
        self.viewModel.searchedCompanies = self.viewModel.companyList
        tableView.reloadData()
        return true
    }
    
}

extension CompanyViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.searchTextField.resignFirstResponder()
    }
}
