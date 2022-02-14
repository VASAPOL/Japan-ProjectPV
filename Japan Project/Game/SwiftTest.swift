//
//  SwiftTest.swift
//  Japan Project
//
//  Created by Vasapol on 14/2/2565 BE.
//

import SwiftUI

struct SwiftTest: View {
    // 1.
    @State private var startAnimation: Bool = false
    
    var body: some View {
        VStack {
            // 2.
            Button("Start Animation") {
                withAnimation(.easeInOut(duration: 1)) {
                    self.startAnimation.toggle()
                }
            }
            
            HStack {
                Spacer()
                // 3.
                Text("🚚")
                    .font(.custom("Arial", size: 100))
                    // 4.
                    .offset(x: self.startAnimation ? 0 - UIScreen.main.bounds.width + 100: 0)
            }
        }
    }
}
struct SwiftTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftTest()
    }
}
