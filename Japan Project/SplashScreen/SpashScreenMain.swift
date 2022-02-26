//
//  SpashScreenMain.swift
//  Japan Project
//
//  Created by วศพล อุ่นเรือน on 25/2/2565 BE.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.colorScheme) var colorScheme
    // 1.
    @State var isActive:Bool = false
    @State private var scale: CGFloat = 1
    var body: some View {
        VStack {
            GeometryReader { geo in
                // 2.
                if self.isActive {
                    // 3.
                    ContentView()
                } else {
                    // 4.
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            if (colorScheme == .dark){
                                Image("Logo_Black_Splash")
                                    .resizable()
                                    .frame(width: geo.size.width/5, height: geo.size.width/5)
                                    .scaleEffect(scale)
                                    .animation(.linear(duration: 3), value: scale)
                            }else{
                                Image("Logo_White_Splash")
                                    .resizable()
                                    .frame(width: geo.size.width/5, height: geo.size.width/5)
                                    .scaleEffect(scale)
                                    .animation(.linear(duration: 3), value: scale)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                   
                    
                }
            }
        }
        // 5.
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                    
                }
            }
            scale += 100
        }
    }
    
}

struct SpashScreenMain_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
