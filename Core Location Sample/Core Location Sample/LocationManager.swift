//
//  LocationManager.swift
//  Core Location Sample
//
//  Created by Polina Demidova on 2/6/25.
//
import UIKit
import CoreLocation
import UserNotifications
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private var locationManager: CLLocationManager
    private let locationAccuracy: CLLocationAccuracy = kCLLocationAccuracyNearestTenMeters
    private let distanceFilter: CLLocationDistance = 50 // Update location only after moving 50 meters

    @Published var currentLocation: CLLocation?
    @Published var currentActivity = "Waiting for location updates..."
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = locationAccuracy
    }
    
    // MARK: - Request Permissions
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - Start / Stop Location Tracking
    func startTracking() {
        configureLocationManager()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startMonitoringVisits()
        
        currentActivity = "Tracking started..."
    }
    
    func stopTracking() {
        locationManager.stopUpdatingLocation()
        locationManager.stopMonitoringSignificantLocationChanges()
        locationManager.stopMonitoringVisits()
        
        currentActivity = "Tracking stopped."
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        currentLocation = newLocation
        scheduleLocationUpdateNotification(for: locations.first!)
        print("Updated location: \(newLocation.coordinate.latitude), \(newLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        print("Visit detected: \(visit)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
    // MARK: - Private Helper Methods
    private func configureLocationManager() {
        locationManager.distanceFilter = distanceFilter
    }
    
    private func scheduleLocationUpdateNotification(for location: CLLocation) {
        let content = UNMutableNotificationContent()
        content.title = "Location Updated"
        content.body = "Your current location is: \(location.coordinate.latitude), \(location.coordinate.longitude)"
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: "locationUpdateNotification", content: content, trigger: nil)
        
        let center = UNUserNotificationCenter.current()
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled for location update")
            }
        }
    }
}

