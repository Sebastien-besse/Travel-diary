//
//  LocationManagerView.swift
//  Travel-diary
//
//  Created by Sebastien Besse on 10/12/2024.
//

import Foundation
import CoreLocation

class LocationManagerView{
    
    func getCityName(from location: CLLocationCoordinate2D, name: @escaping (String?)->Void ){
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        
        geocoder.reverseGeocodeLocation(location){ placemarks, error in
            
            if let error{
                print("Error de localisation: \(error.localizedDescription)")
                name(nil)
                return
            }else if let placemark = placemarks?.first{
               let cityName = placemark.locality
               name(cityName)
            }else{
                name(nil)
            }
        }
    }
}
