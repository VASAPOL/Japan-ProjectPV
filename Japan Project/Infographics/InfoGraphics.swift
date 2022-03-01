//
//  InfoGraphics.swift
//  Japan Project
//
//  Created by Vasapol on 27/2/2565 BE.
//

import SwiftUI

struct InfoGraphics1: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack{
                GeometryReader{ geometry in
                    HStack{
                        Spacer()
                        ScrollView{
                            Image("Beige_Collage_Scrapbook_Timeline_Infographic")
                                .resizable()
                                .frame(width: geometry.size.width-20, height: 1000)
                        }.navigationTitle("Plastic Box")
                        Spacer()
                    }
                }
            }.navigationBarItems(leading:
                                    Button(action: {
                //Your Custom Code Here
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
            })
        }.navigationTitle("TEST")
            
    }
}


struct InfoView:View{
    let image_name: String
    let image_name_bk: String
    let toppic_name:String
    let image_height: CGFloat
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        NavigationView{
            VStack{
                GeometryReader{ geometry in
                    HStack{
                        Spacer()
                        ScrollView{
                            if colorScheme == .dark {
                                Image(image_name_bk)
                                    .resizable()
                                    .frame(width: geometry.size.width-20, height: image_height)
                            }else{
                                Image(image_name)
                                    .resizable()
                                    .frame(width: geometry.size.width-20, height: image_height)
                            }
                        }.navigationTitle(toppic_name)
                        Spacer()
                    }
                }
            }.navigationBarItems(leading:
                                    Button(action: {
                //Your Custom Code Here
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
            })
        }.navigationTitle(toppic_name)
    }
}


//Beige_Collage_Scrapbook_Timeline_Infographic

struct InfoGraphics_Previews: PreviewProvider {
    static var previews: some View {
        InfoGraphics1()
    }
}
