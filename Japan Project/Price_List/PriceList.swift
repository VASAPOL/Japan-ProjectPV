//
//  PriceList.swift
//  Japan Project
//
//  Created by Vasapol on 17/2/2565 BE.
//


//
//  ContentView.swift
//  tedt
//
//  Created by วศพล อุ่นเรือน on 24/2/2565 BE.
//

import SwiftUI
import CoreGraphics

struct PriceList: View {
    @State private var searchText = ""
    let id_geo = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    let id_geo1 = [17,18,19,20,21,22,23,24,25]
    let id_geo2 = [26,27,28,29,30,31,32,33,34,35,36,37,38,39,40]
    let id_geo3 = [41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76]
    let id_geo4 = [77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110]
    let id_geo5 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]
    let id_geo6 = [28,29,30,31,32,33,34]
    let ARRNAME = ["เหล็กหนาพิเศษซอยสั้น", "เหล็กหนาซอยสั้น(ยาวไม่เกิน 80 cm)", "เหล็กไม่ซอย", "เหล็กโช๊คอัพ", "ลวดสลิง(มัดมา)", "เหล็กตะปู", "No.1เหล็กหล่อชิ้นเล็ก", "No.2 เหล็กหล่อชิ้นใหญ่ (นน.ไม่เกิน 500 กก.)", "No.3 เหล็กหล่อชิ้นใหญ่ (นน.ไม่เกิน 500-1,500กก.)", "No.4 เหล็กหล่อเครื่องติดข้อเหวี่ยง", "กระป๋อง", "เหล็กรถเก๋ง, ปิคอัพทั้งคัน", "เหล็กขี้กลึง(ดำ,สวย,ฟู)", "ทีบาร์,เมทัลชีท", "เหล็กเส้น 6 หุน (ยาว 2.50 เมตรขึ้นไป)", "สังกะสี", "เหล็กบางไม่ซอย", "กระดาษแข็งกล่องน้ำตาล(A)", "กระดาษสี/กระดาษกล่องรองเท้า/กล่องผลไม้", "กระดาษหนังสือเล่มรวม", "กระดาษย่อยสวย", "กระดาษอาร์ตมัน", "กระดาษถุงปูน", "กระดาษขาว-ดำ", "กระดาษหนังสือพิมพ์", "กระดาษแข็งกล่องน้ำตาล(B)", "ขวดเบียร์ช้าง (สีเขียว สะอาด):ใบ", "ขวดเบียร์ลีโอ:ใบ", "ขวดเบียร์ช้าง (เขียว)/กล่อง/สะอาด", "ขวดเบียร์ลีโอ/กล่อง/สะอาด", "ขวดเหล้าขาว/กล่อง(24) ขวดสุราชุมชน/กล่อง(24)", "ขวดหงส์ทอง(700cc):กล่อง", "ขวดแบลนด์285(700cc):กล่อง", "ขวดน้ำปลา:ใบ", "ขวดน้ำปลา:ใบ พร้อมกล่อง", "เศษแก้วเบียร์ (สะอาด, ไม่มีสิ่งเจือปน)", "เศษแก้วสีแดง", "เศษแก้วสีเขียว", "ขวดไฮเนเก้น(12)/กล่อง/สะอาด","ขวดไฮเนเก้น(24)/กล่อง/สะอาด", "เศษแก้วรวมสี", "ขวดน้ำ PET ใสในเครือเป๊ปซี่", "No.1 ขวดน้ำ PET ใส", "No.2 ขวดน้ำ PET (สีเขียว)", "No.3 ขวดน้ำ PET ใส(สกรีน)", "ขวดน้ำขาว-ขุ่น(HDPE)", "ถังน้ำขาว-ขุ่น20ลิตร (HDPE)", "พลาสติกรวมสี", "พลาสติกจุกน้ำปลา", "พล่าติกแผ่นป้ายอะคีลิค", "พลาสติกขวดน้ำเกลือ(ตัดจุก)", "พลาสติกขวดน้ำเกลือ(ไม่ตัดจุก)", "สายรัด PET (สีเขียวใส)", "สายรัด PP ลอยน้ำ(รวมสี)", "พลาสติกแผ่น VCD", "พลาสติกแผ่น DVD", "ขวด PVC ใส/สี", "ขวดน้ำ PET สีเมาเทนดิวในเครือเป๊ปซี่", "ถุงพลาสติกใหญ่ PE", "ถุงพลาสติกใหญ่ HDPE", "ถุงดำใหญ่(ไม่เปียก)", "แผ่นฟิวเจอร์บอร์ด(สี)", "แผ่นฟิวเจอร์บอร์ด(ดำ)", "ท่อเอสล่อน PVC สีฟ้า", "ท่อเอสล่อน PVC สีเทา", "เปลือกสายไฟ PVC ใหญ่(ดำ)", "เปลือกสาย PVC เล็ก(ดำ)", "เปลือกสาย PVC รวมสี", "รองเท้ายาง PVC", "รองบู๊ท PVC", "ไฟหน้า,ไฟท้ายรถยนต์(P.C.)", "สายยางอ่อน", "สายยางเขียว", "พลาสติก PS ใส กล่อง CD", "โฟม(สะอาด)", "ท่อเอสล่อน PVC สีเหลือง", "พลาสติกสีดำทุกชนิด", "อลูมิเนียมกระป๋องโค้ก","อลูมิเนียมหนาทั่วไป", "อลูมิเนียมเครื่อง,ฝาสูบ,ห้องเกียร์,เสื้อสูบ", "อลูมิเนียมลูกสูบใหญ่", "อลูมิเนียมหม้อน้ำ", "อลูมิเนียมล้อแม็กซ์", "อลูมิเนียมกระทะผัด", "อลูมิเนียมอัลลอยด์", "อลูมิเนียมเส้น", "อลูมิเนียมฉากขอบใหม่", "อลูมิเนียมฝาจุกแกะ", "อลูมิเนียมจั๊บ", "อลูมิเนียมมู่ลี่", "อลูมิเนียมมุ้งลวด", "ขี้กลึงทองเหลือง", "ขี้กลึงอลูมิเนียม", "หม้อน้ำไส้ทองแดง1-2ชั้น", "No.1 ทองแดงเส้นใหญ่ปอกสวย", "No.3 ทองแดงเส้นเล็ก", "No.4 ทองแดงเส้นเล็ก", "No.5 ทองแดงเส้นเล็ก(เครือขาว)", "ทองเหลืองหนา",  "ทองเหลืองบาง",  "No.304สแตนเลส", "ตะกั่วอ่อน", "ตะกั่วแข็ง", "No.4 แบตเตอรี่มอเตอร์ไซค์", "No.1แบตเตอรี่ขาว", "ทองแดงท่อแอร์ใหม่", "ทองแดงท่อแอร์เก่า", "ทองแดงสะพานไฟ", "ทองแดงไส้หมูใหญ่", "ทองแดงสะพานไฟ", "ทองแดงไส้หมูใหญ่"]


    let ARRV2 = ["จอคอมพิวเตอร์(จอLED)", "เครื่องปริ้นเตอร์,เม้าท์,คีย์บอร์ด", "UPS(เครื่องสำรองไฟ)", "เครื่องแฟ๊กซ์", "อุปกรณ์ IC CPU สี่เหลี่ยมขาทองคำ", "เครื่องเล่น VCD, DVD", "เครื่องเล่นเสียง/สเตอริโอ", "ตู้ลำโพง(เปลือกพลาสติก)", "พัดลมตั้งโต๊ะ, เพดาน", "แอร์คอนดิชั่น+คอมเพรสเซอร์", "เตาอบ, เตาไมโครเวฟ", "กระติกน้ำร้อน", "เตาไฟฟ้า", "หม้อหุงข้าวไฟฟ้า", "กระทะไฟฟ้า", "เตารีดไฟฟ้า", "เครื่องกรองอากาศ", "เครื่องทำน้ำอุ่น", "เครื่องปิ้งขนมปัง", "เครื่องดูดฝุ่น", "เครื่องซักผ้า", "เครื่องปั๊มน้ำ", "เครื่องทำน้ำเย็น", "ปั๊มไดโว่", "พัดลมดูดอากาศ", "จอคอมพิวเตอร์(จอแก้ว)", "ทีวีเก่า(จอแก้ว)", "ฮาร์ดดิสก์", "เทียนไข(แท่งใหญ่)", "เศษเทียนไข", "น้ำมันพืชเก่า/กก.(บรรจุขวดน้ำมันพืช)", "น้ำมันพืชเก่า(ปิ๊บ)", "กากมะพร้าว", "ที่นอนนุ่น", "ยางนอก,ยางใน รถยนต์,รถจักรยาน,รถมอเตอร์ไซค์"]

    let ARRGAMEPRICE = [118,116,51,63,76,94,113,93,80,88,60,69,26,40,116,38,34,43,32,32,32,32,32,37,32,40,5,3,140,100,150,160,70,10,170,17,17,16,190,180,10,120,110,10,10,50,15,30,30,40,30,10,20,15,120,60,4,20,13,10,7,20,10,110,5,40,30,20,55,115,20,45,12,10,15,21,10,570,610,650,610,430,810,430,460,840,720,440,390,350,320,260,80,1410,2930,2660,2600,2500,1890,1790,520,520,500,241,274,2800,2660,2690,2630,2690,2630]
    let ARRGAMEPRICE2 = [10,10,120,15,3000,5,5,5,50,140,15,15,60,60,60,40,20,40,40,20,20,50,50,70,20,10,10,80,60,30,270,5300,75,25,2]    //let ARRPICNAME = ["B1","B2","B3","B4","B5","B6","B7","B8","B9","B10","B11","B12","B13","B14","B15","B16","B17","B18","B19","B20","B21","B22","B23","B24","B25","B26","B27","B28","B29","B30","B31","B32","B33","B34","B35","B36","B37","B38”,”B39”,”B40”,”B41”,”B42”,”B43”,”B44”,”B45”,”B46”,”B47”,”B48”,”B49”,”B50",”B60”,”B61”,”B62”,”B63”,”B64”,”B65”,"B66","B67","B68","B69","B70","B71","B72","B73","B74",""B75",”B76”,”B77”,”B78”,”B79”,”B80”,”B81”,”B82”,”B83”,”B84”,”B85”,”B86”,”B87”,”B89”,”B90”,”B91”,”B92",”B93”,”B94”,”B95”,”B96”,”B97”,”B98”,”B99”,”B100”,”B101”,”B102”,”B103”,”B104”,”B105”,”B106”,”B107”,”B108”,”B109”,”B110”,”B111”,”B112”,”B113”,”B114”,”B115”,”B116”,”117”,”B118”,”B119”,”B120”,”B121”,”B122”,”B123”,”B124”,”B125”,”B126”,”B127”,”B128”,”B129”,”B130”,”B131”,”B132”,”B133”,”B134”,”B135”,”B136”,”B137”,”B138”,”B139”,”B140”,”B141”,”B142”,”B143”,”B144”]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                List{
                    DisclosureGroup(content: {
                        ForEach(id_geo, id: \.self) { (id_D) in
                            Price_Spacer_Front_End(Name: ARRNAME[id_D],Price: String(ARRGAMEPRICE[id_D]),Picname: "B"+String(id_D))
                        }
                    }, label: {
                        HStack{
                            Image("Metal_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("Steel")
                            Spacer()
                        }
                    })
                    DisclosureGroup(content: {
                        ForEach(id_geo1, id: \.self) { (id_D) in
                            Price_Spacer_Front_End(Name: ARRNAME[id_D],Price: String(ARRGAMEPRICE[id_D]),Picname: "B"+String(id_D))
                        }
                    }, label: {
                        HStack{
                            Image("Paper_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("Paper")
                        }
                    })
                    DisclosureGroup(content: {
                        ForEach(id_geo2, id: \.self) { (id_D) in
                            Price_Spacer_Front_End(Name: ARRNAME[id_D],Price: String(ARRGAMEPRICE[id_D]),Picname: "B"+String(id_D))
                        }
                    }, label: {
                        HStack{
                            Image("Glass_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("Glass")
                        }
                    })
                    DisclosureGroup(content: {
                        ForEach(id_geo3, id: \.self) { (id_D) in
                            Price_Spacer_Front_End(Name: ARRNAME[id_D],Price: String(ARRGAMEPRICE[id_D]),Picname: "B"+String(id_D))
                        }
                    }, label: {
                        HStack{
                            Image("Plastic_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("Plastic")
                        }
                    })
                    DisclosureGroup(content: {
                        ForEach(id_geo4, id: \.self) { (id_D) in
                            if (id_D < 108){
                                Price_Spacer_Front_End(Name: ARRNAME[id_D],Price: String(ARRGAMEPRICE[id_D]),Picname: "B"+String(id_D))
                            }
                        }
                    }, label: {
                        HStack{
                            Image("FerousMetal_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("Non Ferous Metal")
                        }
                    })
                    DisclosureGroup(content: {
                        ForEach(id_geo5, id: \.self) { (id_D5) in
                            Price_Spacer_Front_End(Name: ARRV2[id_D5],Price: String(ARRGAMEPRICE2[id_D5]),Picname: "BB"+String(id_D5))
                        }
                    }, label: {
                        HStack{
                            Image("Computer_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("E-Waste")
                        }
                    })
                    DisclosureGroup(content: {
                        ForEach(id_geo6, id: \.self) { (id_D6) in
                            Price_Spacer_Front_End(Name: ARRV2[id_D6],Price: String(ARRGAMEPRICE2[id_D6]),Picname: "BB"+String(id_D6))
                        }
                    }, label: {
                        HStack{
                            Image("Others_Pic")
                                .resizable()
                                .frame(width: 70, height:70)
                            Text("Others")
                        }
                    })
                }.searchable(text: $searchText)
                    .navigationTitle("Contacts")
                .navigationBarItems(leading:
                                        Button(action: {
                                          //Your Custom Code Here
                                          self.presentationMode.wrappedValue.dismiss()
                                        }) {
                                          HStack {
                                            Image(systemName: "chevron.backward")
                                            Text("Back")
                                          }
                                      })
                .navigationTitle("Trash Price")
                
            }
        }
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
            Image("Price_Logo")
                .resizable()
                .frame(width: 50, height: 70)
        }
    }
}

struct PriceList_Previews: PreviewProvider {
    static var previews: some View {
        PriceList()
    }
}
