//
//  MainMapViewController.swift
//  Nashdrop
//
//  Created by John Saba on 7/5/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit
import GoogleMaps

protocol MapViewControllerDelegate {
    func fetchedCenters() -> [RecycleCenter]
}

class MainMapViewController: UIViewController {
    
    var mapView: GMSMapView?
    var delegate: MapViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainMapViewController.centersUpdated(_:)), name: NashDropNotifications.CentersUpdated, object: nil)
        
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86, longitude: 151.20, zoom: 9)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView!.myLocationEnabled = true
        self.view = mapView!
        
        updateCenters()
        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
    }
    
    func centersUpdated(notification: NSNotification) {
        // TODO: might be needed if we expect to update the maps while inside maps view
    }
    
    func updateCenters() {
        
        var cameraPos: GMSCameraPosition? = nil
        guard let delegate = delegate else { return }
        
        for center in delegate.fetchedCenters() {
            if let lat = center.lat, let long = center.long, mv = mapView {
                if cameraPos == nil {
                    cameraPos = GMSCameraPosition.cameraWithLatitude(lat, longitude: long, zoom: 9)
                    mapView?.camera = cameraPos!
                }
                
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2DMake(lat, long)
                marker.title = center.name
                marker.map = mv
            }
        }
    }

}
