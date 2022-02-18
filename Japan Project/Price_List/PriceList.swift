//
//  PriceList.swift
//  Japan Project
//
//  Created by Vasapol on 17/2/2565 BE.
//

import SwiftUI
import CoreGraphics

struct PriceList: View {
    let id_geo = [0,1,2]
    let ARRNAME = ["HIHHH","HI","HELLO"]
    let ARRPRICE = ["10","6156","8521"]
    let ARRGAMEPRICE = ["10","6156","8521"]
    let ARRPICNAME = ["454564565","6156","8521"]
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                List{
                    DisclosureGroup(content: {
                        ForEach(id_geo, id: \.self) { (id_D) in
                            Price_Spacer_Front_End(Name: ARRNAME[id_D],Price: ARRPRICE[id_D],Picname: ARRPICNAME[id_D])
                        }
                    }, label: {
                        HStack{
                            Image("Test_Images")
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text("HI")
                        }
                    })
                }
                .navigationTitle("D")
            }
        }.navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

struct Price_Spacer_Front_End: View {
    var Name: String
    var Price: String
    var Picname: String
    var body: some View{
        HStack{
            Image(Picname)
                .resizable()
                .frame(width: 70, height: 70)
            Text(Name)
            Spacer()
            Text(Price)
            Text("฿")
        }
    }
}

struct PriceList_Previews: PreviewProvider {
    static var previews: some View {
        PriceList()
    }
}
