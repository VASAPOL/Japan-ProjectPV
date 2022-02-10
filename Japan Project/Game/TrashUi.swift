//
//  TrashUi.swift
//  Japan Project
//
//  Created by Vasapol on 10/2/2565 BE.
//

import SwiftUI

struct Trash_Ui: View {
    @ObservedObject var datas = ReadData()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}

struct Trash_Ui_Previews: PreviewProvider {
    static var previews: some View {
        Trash_Ui()
    }
}
