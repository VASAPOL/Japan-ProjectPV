//
//  test.swift
//  Japan Project
//
//  Created by Vasapol on 13/2/2565 BE.
//

import SwiftUI

struct Image_Game_M: View {
    let Game_image_Name: String
    var Game_padding_location: Double
    var widthPic: Double
    var heightPic: Double
    var body: some View {
        VStack{
            Button(action:{
                
            }){
                Image(Game_image_Name)
                    .resizable()
                    .frame(width: widthPic, height: heightPic)
            }.frame(width: widthPic, height: heightPic)
                .padding(.top, Game_padding_location)
            Spacer()
        }
    }
}

struct Image_Game_M_Previews: PreviewProvider {
    static var previews: some View {
        Image_Game_M(Game_image_Name: "Aerosol_Can_Pic", Game_padding_location: 100,widthPic: 100, heightPic: 150)
    }
}
