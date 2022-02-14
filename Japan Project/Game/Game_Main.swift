//
//  Game_Main.swift
//  Japan Project
//
//  Created by Vasapol on 11/2/2565 BE.
//

import SwiftUI
import SpriteKit

struct UpperControl: View{
    var body: some View{
        VStack{
            Text("Time Left")
                .font(.title2)
                .padding(.top, 10)
            Text("00:00")
                .font(.system(size: 50))
        }
    }
}

struct trashCheck: View {
    @State var locationScreen = 0
    var body: some View {
        ZStack{
            Image_Game_M(Game_image_Name: "Aerosol_Can_Pic", Game_padding_location: Double(100),widthPic: 100, heightPic: 150)
            VStack{
                Spacer()
                HStack{
                    Button(action:{
                        
                    }){
                        Image("Trash_Can_Danger")
                            .resizable()
                            .frame(width: 80, height: 120)
                    }
                    Button(action:{
                        
                    }){
                        Image("Trash_Can_Genaral")
                            .resizable()
                            .frame(width: 80, height: 120)
                    }
                    Button(action:{
                        
                    }){
                        Image("Trash_Can_Organic")
                            .resizable()
                            .frame(width: 80, height: 120)
                    }
                    Button(action:{
                        
                    }){
                        
                        Image("Trash_Can_Recycle")
                            .resizable()
                            .frame(width: 80, height: 120)
                    }
                }
            }
        }
    }
}

struct mainMix: View{
    var body: some View{
        VStack{
            UpperControl()
            Spacer()
            trashCheck()
            
        }
    }
}

struct Game_Main_Previews: PreviewProvider {
    static var previews: some View {
        mainMix()
    }
}
