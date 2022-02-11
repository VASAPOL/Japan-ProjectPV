
//
//  MapsView.swift
//  Japan Project
//
//  Created by Vasapol on 11/2/2565 BE.
//

import SwiftUI
import MapKit
import PartialSheet

var StoreName_Pub = ""
var StoreImage_Pub = ""
var StoreDetail_Pub = ""
var StoreURL_Street_View_Pub = ""


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
                latitude: 13.6383422,
                longitude: 100.4384458),
                color: .yellow,
                Store_Name: "อาร์บีอาร์ วงษ์พาณิชย์ สาขาเทียนทะเล 7",
                Store_Image: "A0_Image",
                Store_Detail: "เปิดทำการตั้งแต่ 08:00-18:00 น. และปิดร้านทุกวันพฤหัสบดี รับซื้อของเก่าเพื่อนำไปรีไซเคิล",
                Street_View_Link: "No_Street_View"
            ),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6320694,
                longitude: 100.4170332),
                color: .yellow,
                Store_Name: "ร้านสายฝนรับซื้อของเก่า สะแกงาม 26",
                Store_Image: "A1_Image",
                Store_Detail: "เปิดทำการตั้งแต่ 07:00-17:00 น. และปิดร้านทุกวันจันทร์",
                Street_View_Link: "https://www.google.com/maps/@13.6319002,100.4170354,3a,75y,6.13h,77.58t/data=!3m6!1e1!3m4!1sUtuxgCYNwI3BTRqYXhgZLA!2e0!7i16384!8i8192"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.5930932,
                longitude: 100.3382311),
                color: .blue,
                Store_Name: "วิชัย",
                Store_Image: "A2_Image",
                Store_Detail: "A0_Image",
                Street_View_Link: "https://www.google.com/maps/@13.6629327,100.4548174,3a,75y,297.01h,82.84t/data=!3m6!1e1!3m4!1sfv6QKuFVsnLa5V4wNWC2Hg!2e0!7i16384!8i8192"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6462865,
                longitude: 100.4488143),
                color: .yellow,
                Store_Name: "วงษ์พาณิชย์ บางขุนเทียน",
                Store_Image: "A3_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/place/%E0%B8%A7%E0%B8%87%E0%B8%A9%E0%B9%8C%E0%B8%9E%E0%B8%B2%E0%B8%93%E0%B8%B4%E0%B8%8A%E0%B8%A2%E0%B9%8C+%E0%B8%9A%E0%B8%B2%E0%B8%87%E0%B8%82%E0%B8%B8%E0%B8%99%E0%B9%80%E0%B8%97%E0%B8%B5%E0%B8%A2%E0%B8%99/@13.6462721,100.4489464,3a,75y,233.26h,88.53t/data=!3m6!1e1!3m4!1s9hNIZMQl60mnW3Ael_ZQTw!2e0!7i16384!8i8192!4m11!1m2!2m1!1z4Lin4LiH4Lip4LmM4Lie4Liy4LiT4Li04LiK4Lii4LmMX-C4muC4suC4h-C4guC4uOC4meC5gOC4l-C4teC4ouC4mQ!3m7!1s0x30e2a3282582afa9:0x1142bfaf2216c42d!8m2!3d13.6461873!4d100.4488193!14m1!1BCgIgARICCAI!15sCkPguKfguIfguKnguYzguJ7guLLguJPguLTguIrguKLguYxf4Lia4Liy4LiH4LiC4Li44LiZ4LmA4LiX4Li14Lii4LiZWkgiRuC4p-C4h-C4qeC5jCDguJ7guLLguJPguLTguIrguKLguYwgXyDguJrguLLguIfguILguLjguJnguYDguJfguLXguKLguJmSAQ1zdXJwbHVzX3N0b3Jl"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6487522,
                longitude:100.3890106),
                color: .yellow,
                Store_Name: "วงษ์พาณิชย์ บางขุนเทียน",
                Store_Image: "A3_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/place/%E0%B8%A7%E0%B8%87%E0%B8%A9%E0%B9%8C%E0%B8%9E%E0%B8%B2%E0%B8%93%E0%B8%B4%E0%B8%8A%E0%B8%A2%E0%B9%8C+%E0%B8%9A%E0%B8%B2%E0%B8%87%E0%B8%82%E0%B8%B8%E0%B8%99%E0%B9%80%E0%B8%97%E0%B8%B5%E0%B8%A2%E0%B8%99/@13.6462721,100.4489464,3a,75y,233.26h,88.53t/data=!3m6!1e1!3m4!1s9hNIZMQl60mnW3Ael_ZQTw!2e0!7i16384!8i8192!4m11!1m2!2m1!1z4Lin4LiH4Lip4LmM4Lie4Liy4LiT4Li04LiK4Lii4LmMX-C4muC4suC4h-C4guC4uOC4meC5gOC4l-C4teC4ouC4mQ!3m7!1s0x30e2a3282582afa9:0x1142bfaf2216c42d!8m2!3d13.6461873!4d100.4488193!14m1!1BCgIgARICCAI!15sCkPguKfguIfguKnguYzguJ7guLLguJPguLTguIrguKLguYxf4Lia4Liy4LiH4LiC4Li44LiZ4LmA4LiX4Li14Lii4LiZWkgiRuC4p-C4h-C4qeC5jCDguJ7guLLguJPguLTguIrguKLguYwgXyDguJrguLLguIfguILguLjguJnguYDguJfguLXguKLguJmSAQ1zdXJwbHVzX3N0b3Jl"),
        //Street Fail
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.616172,
                longitude: 100.452783),
                color: .yellow,
                Store_Name: "ร้านสุวรรณ์สาขา 2 รับซื้อของเก่า",
                Store_Image: "A4_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "No_Street_View"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6713225,
                longitude: 100.4530098),
                color: .yellow,
                Store_Name: "บริษัท เจี่ยฮวดเส็งจั่น จำกัด",
                Store_Image: "A6_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "No_Street_View"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6392002,
                longitude: 100.41652),
                color: .yellow,
                Store_Name: "นิวรา ค้าของเก่า",
                Store_Image: "A7_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/@13.6391299,100.4167494,3a,75y,301.61h,86.22t/data=!3m7!1e1!3m5!1sbAzYcPdVx9nJAElj4ELcyA!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fpanoid%3DbAzYcPdVx9nJAElj4ELcyA%26cb_client%3Dmaps_sv.tactile.gps%26w%3D203%26h%3D100%26yaw%3D314.16257%26pitch%3D0%26thumbfov%3D100!7i16384!8i8192"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6504381,
                longitude: 100.449602),
                color: .yellow,
                Store_Name: "ร้านเอส รับซื้อของเก่ารีไซเคิล",
                Store_Image: "A8_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/@13.6507132,100.4498839,3a,75y,209.6h,89.7t/data=!3m6!1e1!3m4!1sZnqGs7zba8HGQnWVHeb_Aw!2e0!7i16384!8i8192"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6075998,
                longitude: 100.4266386),
                color: .yellow,
                Store_Name: "วงษ์พาณิชย์ เทียนทะเล 26",
                Store_Image: "A9_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/@13.6077033,100.4268017,3a,75y,221.84h,90t/data=!3m7!1e1!3m5!1smWNGhlPjif_WQZkdZeOybQ!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fpanoid%3DmWNGhlPjif_WQZkdZeOybQ%26cb_client%3Dmaps_sv.tactile.gps%26w%3D203%26h%3D100%26yaw%3D221.02643%26pitch%3D0%26thumbfov%3D100!7i16384!8i8192"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6279269,
                longitude: 100.4239575),
                color: .yellow,
                Store_Name: "ทรัพย์ศรีภารับซื้อโลหะ",
                Store_Image: "A10_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/place/วงษ์พาณิชย์+เทียนทะเล26/@13.6076194,100.4244993,17z/data=!3m1!4b1!4m5!3m4!1s0x30e2bca675e9407b:0x9b528e29112a121c!8m2!3d13.6076194!4d100.426688"),
        MyAnnotationItem(
            coordinate: CLLocationCoordinate2D(
                latitude: 13.6286959,
                longitude: 100.4110078),
                color: .yellow,
                Store_Name: "ร้าน อุ้ยเสี่ยวป้อ รีไซเคิล",
                Store_Image: "A11_Image",
                Store_Detail: "เปิดทุกวัน เวลา 08:00-18:00 น.",
                Street_View_Link: "https://www.google.com/maps/place/%E0%B8%A7%E0%B8%87%E0%B8%A9%E0%B9%8C%E0%B8%9E%E0%B8%B2%E0%B8%93%E0%B8%B4%E0%B8%8A%E0%B8%A2%E0%B9%8C+%E0%B8%9A%E0%B8%B2%E0%B8%87%E0%B8%82%E0%B8%B8%E0%B8%99%E0%B9%80%E0%B8%97%E0%B8%B5%E0%B8%A2%E0%B8%99/@13.6462721,100.4489464,3a,75y,233.26h,88.53t/data=!3m6!1e1!3m4!1s9hNIZMQl60mnW3Ael_ZQTw!2e0!7i16384!8i8192!4m11!1m2!2m1!1z4Lin4LiH4Lip4LmM4Lie4Liy4LiT4Li04LiK4Lii4LmMX-C4muC4suC4h-C4guC4uOC4meC5gOC4l-C4teC4ouC4mQ!3m7!1s0x30e2a3282582afa9:0x1142bfaf2216c42d!8m2!3d13.6461873!4d100.4488193!14m1!1BCgIgARICCAI!15sCkPguKfguIfguKnguYzguJ7guLLguJPguLTguIrguKLguYxf4Lia4Liy4LiH4LiC4Li44LiZ4LmA4LiX4Li14Lii4LiZWkgiRuC4p-C4h-C4qeC5jCDguJ7guLLguJPguLTguIrguKLguYwgXyDguJrguLLguIfguILguLjguJnguYDguJfguLXguKLguJmSAQ1zdXJwbHVzX3N0b3Jl"),
    ] //No_Street_View
        var body: some View {
            NavigationView{
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
                                StoreURL_Street_View_Pub = item.Street_View_Link!
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
                }.ignoresSafeArea()
            }.halfSheet(isPresented: self.$showHalfSheet) {
                SheetContents()
            }
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
    let Street_View_Link: String?
    var tint: Color { color ?? .red }
    let id = UUID()
}


struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
