//
//  ContentView.swift
//  Japan Project
//
//  Created by Vasapol on 8/2/2565 BE.
//

import SwiftUI

let Input_String = "0"
let Type_Input = (Input_String as NSString).integerValue
//Contact_Sale
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var textx: String = "0"
    @State var supply = Int(Type_Input)/10
    @State private var isShowingPricelistView = false
    @State private var isShowingMapsView = false
    @State private var isShowingWebSplashView = false
    @State private var isShowingSignInView = false
    @State private var isShowingInfo1View = false
    @State private var isShowingInfo2View = false
    @State private var isShowingInfo3View = false
    @State private var isShowingInfo4View = false
    @State private var isShowingCartView = false
    @EnvironmentObject var vm: UserAuthModel
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                ScrollView{
                    VStack{
                        Group{
                        NavigationLink(destination: PriceList().navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingPricelistView) { EmptyView() }
                        NavigationLink(destination: MapsView().navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingMapsView) { EmptyView() }
                        NavigationLink(destination: WebSplash().navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingWebSplashView) { EmptyView() }//SiginView
                        NavigationLink(destination: backUp_Ui().navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingSignInView) { EmptyView() }//SiginView
                        NavigationLink(destination: InfoView(image_name: "Spoon", image_name_bk: "Spoon_BK", toppic_name: "Plastic Spoon and fork", image_height: geometry.size.width*1.5).navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingInfo1View) { EmptyView() }
                        NavigationLink(destination: InfoView(image_name: "Beige_Collage_Scrapbook_Timeline_Infographic", image_name_bk: "Beige_Collage_Scrapbook_Timeline_Infographic_BK", toppic_name: "Plastic Box", image_height: geometry.size.width*2.5).navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingInfo2View) { EmptyView() }
                        NavigationLink(destination: InfoView(image_name: "PlasticBag", image_name_bk: "PlasticBag_BK", toppic_name: "Plastic Bag", image_height: geometry.size.width*2.5).navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingInfo3View) { EmptyView() }
                            NavigationLink(destination: InfoView(image_name: "PlasticBottle", image_name_bk: "PlasticBottle_BK", toppic_name: "Plastic Bottle", image_height: geometry.size.height*1.5).navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingInfo4View) { EmptyView() }
                        NavigationLink(destination: LoopingPlayer2().navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingCartView) { EmptyView() }
                        }
                        ZStack(){
                            Rectangle()
                                .frame( height: 250)
                                .foregroundColor(.blue)
                                .ignoresSafeArea()
                            VStack{
                                HStack{
                                    VStack{
                                        Button(action: {
                                            self.isShowingCartView = true
                                        }, label: {
                                            Image(systemName: "cart")
                                                .resizable()
                                                .foregroundColor(.black)
                                                .frame(width: 50, height: 50)
                                        })
                                    }.padding([.top, .leading])
                                    Spacer()
                                        .padding(.top, 50.0)
                                    VStack{
                                        Button(action: {
                                            self.isShowingSignInView = true
                                        }, label: {
                                            if vm.givenName == "Not Logged In"{
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .foregroundColor(.black)
                                                    .frame(width: 50, height: 50)
                                            }else{
                                                AsyncImage(url: URL(string: vm.profilePicUrl)){ phase in
                                                    switch phase {
                                                    case .success(let image):
                                                        image.resizable()
                                                        image.frame(width: 70, height: 70)
                                                        image.foregroundColor(.blue)
                                                        image.clipShape(Circle())
                                                    case .failure:
                                                        Image(systemName: "photo")
                                                    case .empty:
                                                        Image(systemName: "photo")
                                                    @unknown default:
                                                        Image(systemName: "photo")
                                                            .frame(width: 70, height: 70)
                                                            .clipShape(Circle())
                                                    }
                                                }
                                            }
                                        })
                                        
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
                                                PictureView(picname: "Price_Logo", LableDown: "Price", Scalern: true)
                                                    .padding(.horizontal, 2)
                                                Spacer()
                                            }
                                            Button(action:{
                                                self.isShowingMapsView = true
                                                print("H")
                                            }){
                                                PictureView(picname: "Maps_Logo", LableDown: "Maps", Scalern: true)
                                                    .padding(.horizontal, 2)
                                                Spacer()
                                            }
                                            
                                            Button(action:{
                                                self.isShowingCartView = true
                                                //self.isShowingPricelistView = true
                                            }){
                                                PictureView(picname: "Saleng_Pic", LableDown: "Saleng", Scalern: false)
                                                    .padding(.horizontal, 2)
                                                Spacer()
                                            }
                                            
                                            Button(action:{
                                                self.isShowingPricelistView = true
                                            }){
                                                PictureView(picname: "Game_Logo", LableDown: "Game", Scalern: false)
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
                                    
                                    boxView(picna :"pls_sp&f",picna_BK: "pls_sp&f_bk",geo_so: geometry.size.width, theme: colorScheme)
                                }
                                Button(action:{
                                    self.isShowingInfo2View = true
                                }){
                                    boxView(picna :"pls_box",picna_BK: "pls_box_bk",geo_so: geometry.size.width, theme: colorScheme)
                                    
                                }
                                Spacer()
                            }
                            HStack{
                                Button(action:{
                                    self.isShowingInfo3View = true
                                }){
                                    boxView(picna :"pls_bag",picna_BK: "pls_bag_bk",geo_so: geometry.size.width, theme: colorScheme)
                                }
                                Button(action:{
                                    self.isShowingInfo4View = true
                                }){
                                    boxView(picna :"pls_bottle",picna_BK: "pls_bottle_bk",geo_so: geometry.size.width, theme: colorScheme)
                                }
                                Spacer()
                            }
                            VStack{Spacer()}
                        }
                        //Spacer()
                    }.hiddenNavigationBarStyle()
                        .ignoresSafeArea()
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
    var Scalern: Bool
    var body: some View{
        HStack{
            VStack{
                //.resizable()
                if (Scalern){
                    Image(picname)
                        .resizable()
                        .frame(width: 50, height: 70)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .cornerRadius(50)
                        .foregroundColor(Color.blue)
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }else{
                    
                    Image(picname)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        .cornerRadius(50)
                        .foregroundColor(Color.blue)
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
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
    var picna: String
    var picna_BK: String
    var geo_so: CGFloat
    var theme: ColorScheme
    var body: some View{
        VStack{
            if (theme == .dark){
                Image(picna_BK)
                    .resizable()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 4))
                    .cornerRadius(10)
                    .padding(.all, 5)
                    .frame(height: geo_so/2)
                    .foregroundColor(.black)
                //.frame(height: 200)
                    .ignoresSafeArea()
            }else{
                Image(picna)
                    .resizable()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 4))
                    .cornerRadius(10)
                    .padding(.all, 5)
                    .frame(height: geo_so/2)
                    .foregroundColor(.black)
                //.frame(height: 200)
                    .ignoresSafeArea()
            }
            
            //Spacer()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
