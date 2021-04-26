//
//  CityCell.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import UIKit

class CityCell: UITableViewCell {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var subtitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    private func setupView() {
        
        // titleLbl
        titleLbl.font = UIFont.boldSystemFont(ofSize: 14)
        
        // subtitleLbl
        subtitleLbl.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
}

extension CityCell: BackbaseTableViewCell {
    func configureCellWith(_ item: City) {
        if let city = item.name, let code = item.country {
            titleLbl.text = "\(city), \(code)"
        }
        
        if let longitude = item.coordinate?.latitude, let latitude = item.coordinate?.latitude {
            subtitleLbl.text = "lon: \(longitude), lat: \(latitude)"
        }
    }
}
