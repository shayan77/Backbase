//
//  MapViewController.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, Storyboarded {
    
    // MARK: - Properties
    @IBOutlet var map: MKMapView!
    
    weak var coordinator: AppCoordinator?
    
    let mapViewModel = MapViewModel()
    
    // MARK: - ViewCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupBindings()
    }
    
    // MARK: - Customizing View
    private func setupView() {
        print(mapViewModel.longitude)
        print(mapViewModel.latitude)
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        
        // Subscribe to coordintaes
        
    }
}
