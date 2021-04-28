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
    
    private var _name: String = ""
    public var name: String {
        get {
            return _name
        } set {
            _name = newValue
        }
    }
        
    public var city: City? {
        didSet {
            _longitude = city?.coordinate?.longitude ?? 0.0
            _latitude = city?.coordinate?.latitude ?? 0.0
            _name = city?.name ?? ""
        }
    }
}
