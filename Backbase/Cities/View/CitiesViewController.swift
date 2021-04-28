//
//  CitiesViewController.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import UIKit

class CitiesViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    @IBOutlet var citiesTableView: UITableView!
    
    private var citiesTableViewDataSource: BackbaseTableViewDataSource<CityCell>!
    
    weak var coordinator: AppCoordinator?
    
    let citiesViewModel = CitiesViewModel(citiesService: CitiesOfflineService.shared)
    
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
        getData()
    }

    // MARK: - Customizing View
    private func setupView() {
        // productsTableViewDataSource
        citiesTableViewDataSource = BackbaseTableViewDataSource(cellHeight: 60, items: [], tableView: citiesTableView, delegate: self, animationType: .type2(0.5))
        citiesTableView.delegate = citiesTableViewDataSource
        citiesTableView.dataSource = citiesTableViewDataSource
        
        createSearchControl()
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        
        // Subscribe to cities
        citiesViewModel.cities = { [weak self] cities in
            guard let self = self else { return }
            // Add new products to tableView dataSource.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.citiesTableViewDataSource.refreshWithNewItems(cities)
            })
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
    
    private func createSearchControl() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Cities"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
}

// MARK: - BackbaseTableViewDelegate
extension CitiesViewController: BackbaseTableViewDelegate {
    func tableView<T>(didSelectModelAt model: T) {
        if let city = model as? City {
            self.coordinator?.navigateToMap(city)
        }
    }
}

extension CitiesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        citiesViewModel.searchCitiesWith(searchBar.text ?? "", isSearchEmpty: isSearchBarEmpty)
    }
}
