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
    }
    
    // MARK: - Customizing View
    private func setupView() {
        let location = CLLocation(latitude: mapViewModel.latitude, longitude: mapViewModel.longitude)
        updateLocationOnMap(to: location, with: mapViewModel.name)
    }
    
    private func updateLocationOnMap(to location: CLLocation, with title: String?) {
        
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = location.coordinate
        self.map.removeAnnotations(self.map.annotations)
        self.map.addAnnotation(point)
        
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        self.map.setRegion(viewRegion, animated: true)
    }
}
