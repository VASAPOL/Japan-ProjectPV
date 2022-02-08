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
        HStack{
            Text("d")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
