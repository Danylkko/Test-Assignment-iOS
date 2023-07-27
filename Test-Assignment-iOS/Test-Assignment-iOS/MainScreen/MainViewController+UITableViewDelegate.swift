//
//  MainViewController+UITableViewDelegate.swift
//  Test-Assignment-iOS
//
//  Created by Danylo Litvinchuk on 27.07.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.reuseId, for: indexPath) as! CardTableViewCell
        let model = cards[indexPath.row]
        let viewModel = CardViewModel(card: model)
        cell.viewModel = viewModel
        cell.configure()
        return cell
    }
    
}
