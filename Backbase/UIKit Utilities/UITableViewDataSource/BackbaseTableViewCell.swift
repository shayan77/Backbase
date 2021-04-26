//
//  BackbaseTableViewCell.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import UIKit

public protocol BackbaseTableViewCell: UITableViewCell {
    
    associatedtype CellViewModel
    
    func configureCellWith(_ item: CellViewModel)
    
}
