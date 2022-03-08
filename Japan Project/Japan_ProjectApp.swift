//
//  Japan_ProjectApp.swift
//  Japan Project
//
//  Created by Vasapol on 8/2/2565 BE.
//

import SwiftUI

@main
struct Japan_ProjectApp: App {
    
    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                SplashView()
                //backUp_Ui()
                //SiginView()
            }.environmentObject(userAuth)
            .navigationViewStyle(.stack)
            //SplashView()
            //    .navigationViewStyle(StackNavigationViewStyle())
            //MapsView()
            //PriceList()
        }
    }
}


