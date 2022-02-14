//
//  Start_Game_Screen.swift
//  Japan Project
//
//  Created by Vasapol on 14/2/2565 BE.
//

import SwiftUI

struct End_Game_Screen: View {
    let Highest_Point: String
    let Point: String
    var body: some View {
        ZStack{
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 50)
                .frame(height: 525)
                .foregroundColor(.white)
            VStack{
                Spacer()
                Text("Game Over")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack{
                    Text("Score:")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.black)
                    Text(Point)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.black)
                }
                HStack{
                    Text("Highest Score:")
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.black)
                    Text(Highest_Point)
                        .foregroundColor(.black)
                        .font(.body)
                        .fontWeight(.black)
                }
                Image("Trash_Can_Danger")
                Button(action:{
                    
                }){
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 70)
                            .frame(height: 50)
                            .foregroundColor(.cyan)
                        Text("Main Menu")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.body)
                        
                    }
                }
                Button(action:{
                    
                }){
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 70)
                            .frame(height: 50)
                            .foregroundColor(.green)
                        Text("Retry")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                
            }
        }
    }
}

struct Start_Game_Screen_Previews: PreviewProvider {
    static var previews: some View {
        End_Game_Screen(Highest_Point: String(1000),Point: String(100))
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
