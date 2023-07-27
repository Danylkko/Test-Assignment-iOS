//
//  MainViewController+UITableViewDelegate.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
