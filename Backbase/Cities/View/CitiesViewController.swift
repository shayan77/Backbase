//
//  CitiesViewController.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import UIKit

class CitiesViewController: UIViewController, Storyboarded {
    
    weak var coordinator: AppCoordinator?
    
    let citiesViewModel = CitiesViewModel(citiesService: CitiesOfflineService.shared)

    // MARK: - ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
        getData()
    }

    // MARK: - Customizing View
    private func setupView() {

        
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        
        // Subscribe to cities
        citiesViewModel.cities = { [weak self] cities in
            guard let self = self else { return }
            // Add new products to tableView dataSource.
            self.showAlertWith("\(cities.count)")
        }
        
        // Subscribe to errors
        citiesViewModel.errorHandler = { [weak self] error in
            guard let self = self else { return }
            self.showAlertWith(error)
        }
    }
    
    private func getData() {
        citiesViewModel.getCities()
    }
    
    private func showAlertWith(_ message: String) {
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(ac, animated: true, completion: nil)
    }
}
