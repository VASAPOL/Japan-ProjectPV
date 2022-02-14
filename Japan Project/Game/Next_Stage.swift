//
//  Next_Stage.swift
//  Japan Project
//
//  Created by Vasapol on 14/2/2565 BE.
//

import SwiftUI

struct Next_Stage: View {
    var body: some View {
        ZStack{
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal, 50)
                .frame(height: 525)
                .foregroundColor(.white)
            Text("Stage 1")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct Next_Stage_Previews: PreviewProvider {
    static var previews: some View {
        Next_Stage()
    }
}
