//
//  ContentView.swift
//  Core Location Sample
//
//  Created by Polina Demidova on 2/6/25.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var isTracking = false
    
    var body: some View {
        VStack {
            Text("Location Management Optimization")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.primary)
                .padding(.top, 50)
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()

            Text("""
            Location management is one of the most powerful but also battery-draining features on iOS. 
            We will explore three key techniques for improving location management:
            - Adjusting the distance filter
            - Monitoring significant location changes
            - Automatically detecting visits to important locations like home and work
            """)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding([.top, .horizontal], 20)

            Spacer()

            Text("Current Activity: \(locationManager.currentActivity)")
                .font(.headline)
                .padding(.top, 20)

            Spacer()

            Button(action: {
                if isTracking {
                    locationManager.stopTracking()
                } else {
                    locationManager.startTracking()
                }
                isTracking.toggle()
            }) {
                Text(isTracking ? "Stop Tracking" : "Start Tracking")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 20)
        .onAppear {
            requestNotificationPermission()
            locationManager.requestLocationAuthorization()
        }
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied: \(error?.localizedDescription ?? "No error")")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

