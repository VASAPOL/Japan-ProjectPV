//
//  SiginView.swift
//  Japan Project
//
//  Created by Vasapol on 27/2/2565 BE.
//

import SwiftUI
import GoogleSignIn

struct SiginView: View {
    @EnvironmentObject var vm: UserAuthModel
    
    fileprivate func SignInButton() -> Button<Text> {
        Button(action: {
            vm.signIn()
        }) {
            Text("Sign In")
        }
    }
    
    fileprivate func SignOutButton() -> Button<Text> {
        Button(action: {
            vm.signOut()
        }) {
            Text("Sign Out")
        }
    }
    
    fileprivate func ProfilePic() -> some View {
        AsyncImage(url: URL(string: vm.profilePicUrl))
            .frame(width: 100, height: 100)
    }
    
    fileprivate func UserInfo() -> Text {
        return Text(vm.givenName)
    }
    @State private var username: String = ""
    var frameworks = ["User", "Saleng"]
    @State private var PickerName = "Yuki"
    @State private var selectedFrameworkIndex = 0
    @State private var SalengOrNot = 0
    var body: some View {
        VStack{
            GeometryReader { geometry in
                    VStack{
                        ZStack{
                            if geometry.size.height > 900{
                                VStack{
                                    Rectangle()
                                        .frame(width: geometry.size.width, height: geometry.size.height/3)
                                    Spacer()
                                }.ignoresSafeArea()
                                VStack{
                                    Circle()
                                        .strokeBorder(Color.blue,lineWidth: 4)
                                        .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                                    Spacer()
                                }.ignoresSafeArea()
                            }else{
                                
                                VStack{
                                    Rectangle()
                                        .frame(width: geometry.size.width, height: geometry.size.height/2.5)
                                    Spacer()
                                }.ignoresSafeArea()
                                VStack{
                                    Circle()
                                        .strokeBorder(Color.blue,lineWidth: 4)
                                        .padding(.bottom, 100.0)
                                        .frame(width: geometry.size.width/1.5, height: geometry.size.height/1.5)
                                    Spacer()
                                }.ignoresSafeArea()
                            }
                            VStack{
                                Spacer()
                                HStack{
                                    if geometry.size.height > 900{
                                        Text("Name Surname")
                                            .font(.title)
                                        //.padding(.top, 300)
                                        Image(systemName: "pencil")
                                        //.padding(.top, 300)
                                    }else{
                                        Text("Name Surname")
                                            .font(.title)
                                            .padding(.top, 200)
                                        Image(systemName: "pencil")
                                            .padding(.top, 200.0)
                                    }
                                    
                                }
                                Spacer()
                                HStack{
                                    Picker(selection: $selectedFrameworkIndex, label: Text("")) {
                                        ForEach(0 ..< frameworks.count) {
                                            Text(self.frameworks[$0])
                                        }
                                    }
                                    //Text(frameworks[selectedFrameworkIndex])
                                }
                                Spacer()
                                ScrollView{
                                    TextField(
                                        "Call",
                                        text: $username
                                    )
                                        .textFieldStyle(.roundedBorder)
                                        .padding(.horizontal)
                                    TextField(
                                        "Line iD",
                                        text: $username
                                    )
                                        .textFieldStyle(.roundedBorder)
                                        .padding(.horizontal)
                                    if frameworks[selectedFrameworkIndex] == "Saleng" {
                                        TextField(
                                            "Line iD",
                                            text: $username
                                        )
                                            .textFieldStyle(.roundedBorder)
                                            .padding(.horizontal)
                                        TextField(
                                            "Line iD",
                                            text: $username
                                        )
                                            .textFieldStyle(.roundedBorder)
                                            .padding(.horizontal)
                                    }
                                    
                                }
                                Spacer()
                                Button(action: {
                                    print(geometry.size.height)
                                }, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 12)
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                        Text("Sign Out")
                                            .foregroundColor(.white)
                                    }
                                })
                                
                            }
                        }
                    }
                    Spacer()
                    
                
            }
        }//.navigationTitle("Login")
    }
}



struct SiginView_Previews: PreviewProvider {
    static var previews: some View {
        SiginView()
    }
}

/*
 
 UserInfo()
 ProfilePic()
 //Text(vm.errorMessage)
 if(vm.isLoggedIn){
 Button(action: {
 vm.signOut()
 }) {
 Text("Sign Out")
 }
 }else{
 Button(action: {
 vm.signIn()
 }) {
 Text("Sign In")
 }
 }
 */
