
//
//  MapsView.swift
//  Japan Project
//
//  Created by Vasapol on 11/2/2565 BE.
//

import SwiftUI
import MapKit

struct MapsView: View {
    private enum MapDefaults {
        static let latitude = 45.872
        static let longitude = -1.248
        static let zoom = 0.5
    }
        @State private var region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: MapDefaults.latitude, longitude: MapDefaults.longitude),
            span: MKCoordinateSpan(latitudeDelta: MapDefaults.zoom, longitudeDelta: MapDefaults.zoom))
    let annotationItems = [
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.872,
                longitude: -1.248)),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.8827419,
                longitude: -1.1932383),
                color: .yellow),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.915737,
                longitude: -1.3300991),
                color: .blue)
    ]
        var body: some View {
            VStack {
                Map(coordinateRegion: $region,
                        interactionModes: .all,
                        showsUserLocation: true,
                        annotationItems: annotationItems) { item in
                        MapAnnotation(coordinate: item.coordinate) {
                            Image(systemName: "gamecontroller.fill")
                                .resizable()
                                .foregroundColor(item.tint)
                                .frame(width: 50, height: 40)
                                
                        }
                    }
                
            }
        }
    }


struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    var color: Color?
    var tint: Color { color ?? .red }
    let id = UUID()
}


struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
