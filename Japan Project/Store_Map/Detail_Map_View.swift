//
//  Detail_Map_View.swift
//  Japan Project
//
//  Created by Vasapol on 11/2/2565 BE.
//

import SwiftUI

struct popUP_Detail: View {
    let StoreName_Internal: String
    let StoreImage_Internal: String
    @State private var showWebView = false
    var body: some View{
        VStack{
            HStack(alignment: .center) {
                Spacer()
                Text(StoreName_Internal)
                    .font(.title)
                    .padding()
                Spacer()
            }
            ScrollView(.horizontal){
                HStack{
                    Image(StoreImage_Internal)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 150)
                        Button(action:{
                            //WebView(url: URL(string: StoreURL_Street_View_Pub)!)
                            showWebView.toggle()
                        }){
                            Image("Street_View")
                                .frame(width: 100, height: 100)
                        }
                        
                    }
                
                }
            }.sheet(isPresented: $showWebView) {
                HStack{
                    ZStack{
                        if (StoreURL_Street_View_Pub == "No_Street_View"){
                            Text("Street View is Unavalible")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }else{
                            WebView(url: URL(string: StoreURL_Street_View_Pub)!)
                        }
                        VStack{
                            Rectangle()
                                .frame(width: 500, height: 50)
                            Spacer()
                        }
                        VStack{
                            Button(action:{
                                showWebView.toggle()
                        }){
                            VStack{
                                HStack{
                                    Text("< Back")
                                        .fontWeight(.bold)
                                        .padding([.top, .leading], 15)//.leading
                                        .padding([.leading], 35)
                                    Spacer()
                                }
                                Spacer()
                            }
                            
                        }
                    }
                  }
                    Spacer()
                }
            }
            Divider()
            Spacer()
            Text("Something to show in this sheet")
            Text("Whatever you want.")
            Spacer()
            
        }
    }
}

struct popUP_Detail_Previews: PreviewProvider {
    static var previews: some View {
        popUP_Detail(StoreName_Internal: "A0_Image", StoreImage_Internal: "A0_Image")
    }
}