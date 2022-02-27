//
//  ContentView.swift
//  Japan Project
//
//  Created by Vasapol on 8/2/2565 BE.
//

import SwiftUI

let Input_String = "0"
let Type_Input = (Input_String as NSString).integerValue

struct ContentView: View {
    @State var textx: String = "0"
    @State var supply = Int(Type_Input)/10
    @State private var isShowingPricelistView = false
    @State private var isShowingMapsView = false
    @State private var isShowingWebSplashView = false
    @State private var isShowingInfo1View = false
    @State private var isShowingInfo2View = false
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                VStack{
                    NavigationLink(destination: PriceList().hiddenNavigationBarStyle(), isActive: $isShowingPricelistView) { EmptyView() }
                    NavigationLink(destination: MapsView().hiddenNavigationBarStyle(), isActive: $isShowingMapsView) { EmptyView() }
                    NavigationLink(destination: WebSplash().hiddenNavigationBarStyle(), isActive: $isShowingWebSplashView) { EmptyView() }
                    NavigationLink(destination: InfoGraphics1().hiddenNavigationBarStyle(), isActive: $isShowingInfo1View) { EmptyView() }
                    NavigationLink(destination: InfoGraphics2().hiddenNavigationBarStyle(), isActive: $isShowingInfo2View) { EmptyView() }
                    
                    ZStack(){
                        Rectangle()
                            .frame( height: 250)
                            .foregroundColor(.blue)
                            .ignoresSafeArea()
                        VStack{
                            HStack{
                                Spacer()
                                AsyncImage(url: URL(string: vm.profilePicUrl)){ phase in
                                    switch phase {
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                    case .failure:
                                        Image(systemName: "photo")
                                    case .empty:
                                        Image(systemName: "photo")
                                    @unknown default:
                                        Image(systemName: "photo")
                                    }
                                    
                                }
                                .frame(width: 70, height: 70)
                                .foregroundColor(.blue)
                                .clipShape(Circle())
                                
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.horizontal, 30)
                                    .foregroundColor(.white)
                                    .frame(height: 120)
                                HStack{
                                    HStack{
                                        Spacer(minLength: 40)
                                        Button(action:{
                                            self.isShowingPricelistView = true
                                            print("H")
                                        }){
                                            PictureView(picname: "Street_View", LableDown: "Price")
                                                .padding(.horizontal, 2)
                                            Spacer()
                                        }
                                        Button(action:{
                                            self.isShowingMapsView = true
                                            print("H")
                                        }){
                                            PictureView(picname: "Street_View", LableDown: "Maps")
                                                .padding(.horizontal, 2)
                                            Spacer()
                                        }
                                        
                                        Button(action:{
                                            self.isShowingPricelistView = true
                                        }){
                                            PictureView(picname: "Street_View", LableDown: "Game1")
                                                .padding(.horizontal, 2)
                                            Spacer()
                                        }
                                        Button(action:{
                                            self.isShowingPricelistView = true
                                        }){
                                            PictureView(picname: "Street_View", LableDown: "Game2")
                                                .padding(.horizontal, 2)
                                            
                                        }
                                        Spacer(minLength: 40)
                                    }
                                }
                                
                            }
                            .padding([.top, .trailing])
                            
                        }
                    }
                    VStack{
                        HStack{
                            Button(action:{
                                self.isShowingInfo1View = true
                            }){
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.horizontal, 5)
                                    .foregroundColor(.black)
                                    .frame(height: geometry.size.width/2)
                                    .ignoresSafeArea()
                            }
                            Button(action:{
                                self.isShowingInfo2View = true
                            }){
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.horizontal, 5)
                                    .foregroundColor(.black)
                                    .frame(height: geometry.size.width/2)
                                    .ignoresSafeArea()
                                
                            }
                            Spacer()
                        }
                        HStack{
                            Button(action:{
                                self.isShowingInfo1View = true
                            }){
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.horizontal, 5)
                                    .foregroundColor(.black)
                                    .frame(height: geometry.size.width/2)
                                    .ignoresSafeArea()
                            }
                            Button(action:{
                                self.isShowingInfo2View = true
                            }){
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.horizontal, 5)
                                    .foregroundColor(.black)
                                    .frame(height: geometry.size.width/2)
                                    .ignoresSafeArea()
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }.hiddenNavigationBarStyle()
                    .ignoresSafeArea()
            }.navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct PictureView: View{
    var picname: String
    var LableDown: String
    var body: some View{
        HStack{
            VStack{
                Image(picname)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                    .foregroundColor(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 1)
                    )
                Text(LableDown)
                    .foregroundColor(Color.black)
            }
            
        }
    }
}

struct WebSplash: View{
    var body: some View{
        WebView(url: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
    }
}

struct boxView: View{
    var body: some View{
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 5)
                .foregroundColor(.black)
                .frame(height: 200)
                .ignoresSafeArea()
            Spacer()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
