//
//  SpashScreenMain.swift
//  Japan Project
//
//  Created by วศพล อุ่นเรือน on 25/2/2565 BE.
//

import SwiftUI

struct SplashView: View {
    
    // 1.
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            // 2.
            if self.isActive {
                // 3.
                ContentView()
            } else {
                // 4.
                Text("Awesome Splash Screen!")
                    .font(Font.largeTitle)
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
        }
    }
    
}

struct SpashScreenMain_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
