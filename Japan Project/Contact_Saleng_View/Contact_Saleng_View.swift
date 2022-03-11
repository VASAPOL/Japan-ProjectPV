//
//  Contact_Saleng_View.swift
//  Japan Project
//
//  Created by Vasapol Aurean on 3/3/2565 BE.
//

//
//  Contact_Saleng_View.swift
//  Japan Project
//
//  Created by วศพล อุ่นเรือน on 1/3/2565 BE.
//

import SwiftUI
import Firebase
import UIKit
import PhotosUI
//import FirebaseStorage

//FirebaseImage(id: "sdfsdf").resizable()
//@frozen struct Image
struct Contact_Saleng_View: View {
    //var storageManager = StorageManager()
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var showingOptions = false
    @State private var showSheetPhoto = false
    let id_geo6 = [0,1,2,3]
    let Name = ["Yuki","Japan","Tity","Pol"]
    //let storage = storageManager.app().storage("gs://rise-c9522.appspot.com");
    //let storageRef = await storage.ref();
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(id_geo6, id: \.self) { (id_D6) in
                        NavigationLink(destination: {
                            Saleng_List_View()
                        }, label: {
                            Text(Name[id_D6])
                        })
                        //Price_Spacer_Front_End(Name: ARRV2[id_D6],Price: String(ARRGAMEPRICE2[id_D6]),Picname: "BB"+String(id_D6))
                    }
                   
                }.navigationTitle("Contact Saleng")
            }//.navigationTitle("Contact Saleng")
        }
    }
}


struct Saleng_List_View: View {
    var body: some View{
        NavigationView{
            VStack{
                Text("D")
                Spacer()
            }
        }//.hiddenNavigationBarStyle()
    }
}

struct Contact_View: View {
    var body: some View{
        VStack{
            Text("HI")
        }
    }
}

struct Contact_Sale: View {
    //FirebaseImage(id: "sdfsdf").resizable()
    //@frozen struct Image
    var body: some View {
        VStack{
            GeometryReader { geometry in
                
                VStack{
                    HStack{
                        Spacer()
                        Image("Logo_Black_Splash")
                            .clipShape(Circle())
                            .padding(.top, 50.0)
                        Spacer()
                        
                    }
                    Text("Name Surname")
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geometry.size.width/1.25, height: geometry.size.height/15)
                                .foregroundColor(.blue)
                            Text("Call")
                                .foregroundColor(.black)
                        }
                        
                    })
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geometry.size.width/1.25, height: geometry.size.height/15)
                                .foregroundColor(.blue)
                            Text("Line iD")
                                .foregroundColor(.black)
                        }
                        
                    })
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: geometry.size.width/1.25, height: geometry.size.height/15)
                            .foregroundColor(.white)
                            .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.black, lineWidth: 1))
                        Text("เขต")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: geometry.size.width/1.25, height: geometry.size.height/15)
                            .foregroundColor(.white)
                            .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.black, lineWidth: 1))
                        Text("ที่อยู่ร้าน")
                    }
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geometry.size.width/2.58, height: geometry.size.height/15)
                                .foregroundColor(.white)
                                .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.black, lineWidth: 1))
                            Text("Lat")
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geometry.size.width/2.58, height: geometry.size.height/15)
                                .foregroundColor(.white)
                                .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.black, lineWidth: 1))
                            Text("Long")
                        }
                    }.padding(.bottom, 150.0)
                    HStack{
                        Button(action : {
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: geometry.size.width/2.58, height: geometry.size.height/15)
                                    .foregroundColor(.blue)
                                    .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.blue, lineWidth: 1))
                                Text("Cancel")
                                    .foregroundColor(.black)
                            }
                        })
                        Button(action : {
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: geometry.size.width/2.58, height: geometry.size.height/15)
                                    .foregroundColor(.blue)
                                    .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.blue, lineWidth: 1))
                                Text("Done")
                                    .foregroundColor(.black)
                            }
                        })
                        
                    }
                    //Spacer()
                }
                // .padding(.leading, 32.0)
            }
            
        }
        
    }
    
}
struct Contact_Saleng_View_Previews: PreviewProvider {
    static var previews: some View {
        //Contact_Saleng_View()
        Saleng_List_View()
    }
}


struct Contactss_Saleng_View_Previews: PreviewProvider {
    static var previews: some View {
        Contact_Sale()
    }
}


extension UIImage {
    func aspectFittedToHeight(_ newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}
