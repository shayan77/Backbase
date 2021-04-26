//
//  MapViewModel.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import Foundation

final class MapViewModel {
    
    private var _longitude: Double = 0.0
    public var longitude: Double {
        get {
            return _longitude
        } set {
            _longitude = newValue
        }
    }
    
    private var _latitude: Double = 0.0
    public var latitude: Double {
        get {
            return _latitude
        } set {
            _latitude = newValue
        }
    }
        
    public var coordinate: Coordinate? {
        didSet {
            _longitude = coordinate?.longitude ?? 0.0
            _latitude = coordinate?.latitude ?? 0.0
        }
    }
}
