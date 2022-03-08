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
    @State private var username: String = ""
    var frameworks = ["User", "Saleng"]
    @State private var PickerName = "Yuki"
    @State private var selectedFrameworkIndex = 0
    @State private var SalengOrNot = 0
    @FocusState private var isTextFieldFocused: Bool
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
                                CustomImageView(urlString: vm.profilePicUrl)
                                //AsyncImage(url: URL(string: vm.profilePicUrl))
                                //Image(vm.profilePicUrl)
                                //    .resizable()
                                //.strokeBorder(Color.blue,lineWidth: 4)
                                //    .padding(.bottom, 100.0)
                                //    .frame(width: geometry.size.width/1.5, height: geometry.size.height/1.5)
                                Spacer()
                            }.ignoresSafeArea()
                        }
                        VStack{
                            if geometry.size.height > 900 {
                                if isTextFieldFocused == false{
                                    Spacer(minLength: geometry.size.height/2)
                                }else{
                                    Spacer(minLength: 150)
                                }
                            }else{
                                if isTextFieldFocused == false{
                                    Spacer(minLength: 150)
                                }else{
                                    Spacer()
                                }
                            }
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
                                    .focused($isTextFieldFocused)
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
                                print(isTextFieldFocused)
                                if vm.givenName == "Not Logged In"{
                                    vm.signIn()
                                }else{
                                    vm.signOut()
                                }
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12)
                                        .padding(.horizontal)
                                        .frame(height: 50)
                                    if vm.givenName == "Not Logged In"{
                                        Text("SignIn")
                                            .foregroundColor(.white)
                                    }else{
                                        Text("Sign Out")
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                            })
                            
                        }.ignoresSafeArea()
                    }.ignoresSafeArea()
                    Spacer()
                }
                Spacer()
            }.hiddenNavigationBarStyle()
        }.ignoresSafeArea()
            .navigationBarHidden(true)//.navigationTitle("Login")
            .hiddenNavigationBarStyle()
    }
}

struct backUp_Ui: View{
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
    //var storageManager = StorageManager()
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var showingOptions = false
    @State private var showSheetPhoto = false
    @State private var call:  String = ""
    @State private var line_id:  String = ""
    @State private var jangwhat:  String = ""
    @State private var khet:  String = ""
    @State private var Lat:  String = ""
    @State private var Long:  String = ""
    @State private var isShowingInfo1View = false
    //let storage = storageManager.app().storage("gs://rise-c9522.appspot.com");
    //let storageRef = await storage.ref();
    
    var body: some View {
        VStack{
            NavigationLink(destination: ContentView().navigationViewStyle(StackNavigationViewStyle()).hiddenNavigationBarStyle(), isActive: $isShowingInfo1View) { EmptyView() }
            /*
             AsyncImage(url: URL(string: vm.profilePicUrl)){ phase in
                 switch phase {
                 case .success(let image):
                     image.resizable()
                     image.frame(width: 70, height: 70)
                     image.foregroundColor(.blue)
                     image.clipShape(Circle())
                 case .failure:
                     Image(systemName: "photo")
                 case .empty:
                     Image(systemName: "photo")
                 @unknown default:
                     Image(systemName: "photo")
                         .frame(width: 70, height: 70)
                         .clipShape(Circle())
                 }
             }
             */
            GeometryReader{ geometry in
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.showingOptions = true
                        }, label: {
                            Image(uiImage: self.image)
                                .resizable()
                                .cornerRadius(50)
                                .frame(width: geometry.size.width/1.5, height: geometry.size.width/1.5)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                             
                        })
                        Spacer()
                    }
                    TextField(
                        "Call",
                        text: $call
                    )
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    TextField(
                        "Line iD",
                        text: $line_id
                    )
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                
                    TextField(
                        "Jangwhat",
                        text: $jangwhat
                    )
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    
                    TextField(
                        "Khet",
                        text: $khet
                    )
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    HStack{
                        Text("ที่อยู่ร้าน")
                        Spacer()
                    }
                    
                    HStack{
                        
                        TextField(
                            "Lat",
                            text: $Lat
                        )
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                        
                        TextField(
                            "Long",
                            text: $Long
                        )
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                    }
                    if vm.givenName == "Not Logged In" {
                        Button(action: {
                            vm.signIn()
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: geometry.size.height/15)
                                    .padding([.top, .leading, .trailing])
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundColor(.white)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                HStack{
                                    Image("Google-Logo-Transparent-Background")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("Continue with Google")
                                        .foregroundColor(.black)
                                }
                                .padding(.top)
                            }
                        })
                    }else{
                        Button(action: {
                            vm.signOut()
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: geometry.size.height/15)
                                    .padding([.top, .leading, .trailing])
                                    .textFieldStyle(.roundedBorder)
                                    .foregroundColor(.white)
                                    .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                HStack{
                                    Image("Google-Logo-Transparent-Background")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text("Sign Out")
                                        .foregroundColor(.black)
                                }
                                .padding(.top)
                            }
                        })
                    }
                    Spacer()
                    HStack{
                        Button(action : {
                            self.isShowingInfo1View = true
                        }, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: geometry.size.width/2.58, height: geometry.size.height/15)
                                    .foregroundColor(.blue)
                                    .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.blue, lineWidth: 1))
                                Text("Cancel")
                                    .foregroundColor(.black)
                            }
                        })
                        Button(action : {
                            self.isShowingInfo1View = true
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: geometry.size.width/2.58, height: geometry.size.height/15)
                                    .foregroundColor(.blue)
                                    .overlay( RoundedRectangle(cornerRadius: 20) .stroke(Color.blue, lineWidth: 0.5))
                                Text("Done")
                                    .foregroundColor(.black)
                            }
                        })
                            
                    }
                }
                .padding(.horizontal, 20)
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                }
                .sheet(isPresented: $showSheetPhoto) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
                .confirmationDialog("Select a picture input", isPresented: $showingOptions, titleVisibility: .visible) {
                    Button(action: {
                        self.showSheet = true
                    }, label: {
                        Text("Camera")
                    })
                    Button(action: {
                        self.showSheetPhoto = true
                    }, label: {
                        Text("Photo Libary")
                    })
                }
                /*
                 .sheet(isPresented: $showSheet) {
                 // Pick an image from the photo library:
                 ImagePicker(sourceType: .camera, selectedImage: self.$image)
                 }
                 */
                
                
                
            }
        }.hiddenNavigationBarStyle()
    }
}




struct SiginView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            backUp_Ui()
            //.previewInterfaceOrientation(.portrait)
            //.previewLayout(.device)
            //.previewDevice("iPhone 13 Pro")
            
        }
        //.environmentObject(_:)
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}

struct CustomImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
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

//No ObservableObject of type UserAuthModel found. A View.environmentObject(_:) for UserAuthModel may be missing as an ancestor of this view.
