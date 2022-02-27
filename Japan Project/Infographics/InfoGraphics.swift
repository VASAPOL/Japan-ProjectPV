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


struct InfoGraphics2: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack{
                GeometryReader{ geometry in
                    HStack{
                        Spacer()
                        ScrollView{
                            Image("Spoon")
                                .resizable()
                                .frame(width: geometry.size.width-20, height: 600)
                        }.navigationTitle("Plastic Spoon and fork")
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
        }.navigationTitle("Spoon")
            
    }
}
//Beige_Collage_Scrapbook_Timeline_Infographic

struct InfoGraphics_Previews: PreviewProvider {
    static var previews: some View {
        InfoGraphics1()
    }
}
