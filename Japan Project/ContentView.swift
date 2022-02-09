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
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(width: 500, height: 250)
                        .foregroundColor(.blue)
                        .ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 20)
                        .padding(.horizontal, 60.0)
                        .foregroundColor(.white)
                        .frame(height: 100)
                    HStack{
                        Spacer(minLength:70)
                        PictureView(picname: "Paper_Image", LableDown: "Paper")
                            .padding(.horizontal, 2)
                        PictureView(picname: "Paper_Image", LableDown: "Paper")
                            .padding(.horizontal, 2)
                        PictureView(picname: "Paper_Image", LableDown: "Paper")
                            .padding(.horizontal, 2)
                        PictureView(picname: "Paper_Image", LableDown: "Paper")
                            .padding(.horizontal, 2)
                        PictureView(picname: "Paper_Image", LableDown: "Game")
                            .padding(.horizontal, 2)
                        Spacer(minLength: 70)
                    }
                }
                HStack{
                    boxView()
                    boxView()
                }
                Spacer()
            }.hiddenNavigationBarStyle()
        }.navigationBarHidden(true)
    }
}

struct PictureView: View{
    var picname: String
    var LableDown: String
    var body: some View{
        HStack{
            Spacer()
            Button(action:{
                
            }){
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
                Spacer()
                
            }
        }
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
