
//
//  MapsView.swift
//  Japan Project
//
//  Created by Vasapol on 11/2/2565 BE.
//

import SwiftUI
import MapKit
import PartialSheet

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
                longitude: -1.248),
                color: .yellow,
                Store_Name: "dsda4sgrehe",
                Store_Image: "A0_Image"
            ),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.8827419,
                longitude: -1.1932383),
                color: .yellow,
                Store_Name: "ds",
                Store_Image: "A1_Image"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.915737,
                longitude: -1.3300991),
                color: .blue,
                Store_Name: "ds",
                Store_Image: "A2_Image")
    ]
        var body: some View {
            VStack {
                Map(coordinateRegion: $region,
                        interactionModes: .all,
                        showsUserLocation: true,
                        annotationItems: annotationItems) { item in
                        MapAnnotation(coordinate: item.coordinate) {
                            Button(action:{
                                
                            }){
                                HStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 50)
                                          .frame(width: 50, height: 50)
                                          .foregroundColor(.white)
                                        Image(systemName: "repeat.circle")
                                          .resizable()
                                          .font(.title2)
                                          .foregroundColor(.red)
                                          .shadow(radius: 1)
                                          .frame(width: 50, height: 50)
                                          .foregroundColor(.blue)
                                          .foregroundStyle(.blue)
                                    }
                                    Text(item.Store_Name!)
                                        .multilineTextAlignment(.trailing)
                                        //.frame(width: 100, height: 60)
                                        
                                }
                            }
                        }
                    }
            }
            
        }
    }


struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    var color: Color?
    let Store_Name: String?
    let Store_Image: String?
    var tint: Color { color ?? .red }
    let id = UUID()
}


struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
