//
//  View_Modifier.swift
//  Japan Project
//
//  Created by Vasapol on 9/2/2565 BE.
//


import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
    func halfSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        self.modifier(PartialSheetModifier(isPresented: isPresented, heightFactor: 0.5, sheet: AnyView(content())))
    }
    
    func quarterSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View {
        self.modifier(PartialSheetModifier(isPresented: isPresented, heightFactor: 0.25, sheet: AnyView(content())))
    }
}

struct PartialSheetModifier: ViewModifier {
    @Binding var isPresented: Bool
    var heightFactor: CGFloat
    let sheet: AnyView
    
    func body(content: Content) -> some View {
        content
            .blur(radius: isPresented ? 4.0 : 0.0)
            .overlay(
                Group {
                    if isPresented {
                        PartialSheet(isPresented: self.$isPresented, heightFactor: heightFactor) { sheet }
                    } else {
                        EmptyView()
                    }
                }
            )
    }
}
