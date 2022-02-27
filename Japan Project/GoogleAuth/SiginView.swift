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
    
    var body: some View {
        VStack{
            UserInfo()
            ProfilePic()
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
            Text(vm.errorMessage)
        }.navigationTitle("Login")
    }
}

struct SiginView_Previews: PreviewProvider {
    static var previews: some View {
        SiginView()
    }
}
