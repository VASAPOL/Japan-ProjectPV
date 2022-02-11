
//
//  MapsView.swift
//  Japan Project
//
//  Created by Vasapol on 11/2/2565 BE.
//

import SwiftUI
import MapKit
import PartialSheet

struct popUP_Detail: View{
    let StoreName_Internal: String
    let StoreImage_Internal: String
    var body: some View{
        HStack(alignment: .center) {
            Spacer()
            Text(StoreName_Internal)
                .font(.title)
                .padding()
            Spacer()
        }
        ScrollView(.horizontal){
            GeometryReader { geo in
            }
            Image(StoreImage_Internal)
        }
        Divider()
        Spacer()
        Text("Something to show in this sheet")
        Text("Whatever you want.")
        Spacer()
    }
}

var StoreName_Pub = ""
var StoreImage_Pub = ""
var StoreDetail_Pub = ""


struct MapsView: View {
    @State private var showHalfSheet = false
    @Environment(\.colorScheme) var colorScheme
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
                Store_Image: "A0_Image",
                Store_Detail: "A0_Image"
            ),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.8827419,
                longitude: -1.1932383),
                color: .yellow,
                Store_Name: "ds",
                Store_Image: "A1_Image",
                Store_Detail: "A0_Image"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 45.915737,
                longitude: -1.3300991),
                color: .blue,
                Store_Name: "ds",
                Store_Image: "A2_Image",
                Store_Detail: "A0_Image")
    ]
        var body: some View {
            VStack {
                Map(coordinateRegion: $region,
                        interactionModes: .all,
                        showsUserLocation: true,
                        annotationItems: annotationItems) { item in
                        MapAnnotation(coordinate: item.coordinate) {
                            Button(action:{
                                withAnimation {
                                    self.showHalfSheet.toggle()
                                }
                                StoreName_Pub = item.Store_Name!
                                StoreImage_Pub = item.Store_Image!
                                StoreDetail_Pub = item.Store_Detail!
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
            }.halfSheet(isPresented: self.$showHalfSheet) {
                SheetContents()
            }
        }
    }




struct SheetContents: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        if (colorScheme == .dark){
            VStack {
                popUP_Detail(StoreName_Internal: StoreName_Pub, StoreImage_Internal: StoreImage_Pub)
            }.background(Color.black)
        }else{
            VStack {
                popUP_Detail(StoreName_Internal: StoreName_Pub, StoreImage_Internal: StoreImage_Pub)
            }.background(Color.white)
        }
    }
}



struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    var color: Color?
    let Store_Name: String?
    let Store_Image: String?
    let Store_Detail: String?
    var tint: Color { color ?? .red }
    let id = UUID()
}


struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
