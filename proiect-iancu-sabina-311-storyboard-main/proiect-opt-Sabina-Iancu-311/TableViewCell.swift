//
//  TableViewCell.swift
//  proiect-opt-Sabina-Iancu-311
//
//  Created by user215930 on 5/1/22.
//

import UIKit

struct TableViewCellModel {
    let title: String
}

class TableViewCell: UITableViewCell {
    static let cellId = "TableViewCell"
    
    @IBOutlet weak var titleLabel: TableViewCell!
    
    
    override var reuseIdentifier: String{
        return TableViewCell.cellId
    }
}
