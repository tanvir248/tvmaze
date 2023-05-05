//
//  loginView.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI
import CoreData

struct loginView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var validationPassword: Bool = false
    @State private var gotoRegistrationView: Bool = false
    @State private var isUserName: Bool = false
    @State private var isPassword: Bool = false
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var register: FetchedResults<Users>
    @State private var isWrongUsernamePassword: Bool = false
    let deafults = UserDefaults.standard
    @FocusState private var focusedTextField: Bool
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: searchView().navigationBarBackButtonHidden(true), isActive: $validationPassword){
                    Text(" ")
                }
                NavigationLink(destination: registrationView(), isActive: $gotoRegistrationView){
                    Text(" ")
                }
                
                VStack(spacing: 40){
                    Spacer()
                    logo()
                    Spacer()
                    VStack{
                        TextField("User Name", text: $userName)
                            .bigTextField(isRedBorder: isUserName)
                            .focused($focusedTextField)
                        SecureField("Password", text: $password)
                            .textContentType(.password)
                            .bigTextField(isRedBorder: isPassword)
                            .focused($focusedTextField)
                    }
                    VStack{
                        Button{
                            emptyTextboxDetector()
                            if password != "" && userName != "" {
                                loginValidation()
                            }
                        }label: {
                            largeButton(text: "Login", color: .green)
                        }
                        
                        Button{
                            gotoRegistrationView = true
                        }label: {
                            largeButton(text: "Registrations", color: .red)
                        }
                        
                    }
                    Spacer()
                        .alert(isPresented: $isWrongUsernamePassword) {
                            Alert(title: Text("Error!"),
                                  message: Text("Wrong username or password!"),
                                  dismissButton: .default(Text("Close"))
                            )
                        }
                }
            }.simultaneousGesture(DragGesture().onChanged({ _ in
                focusedTextField = false
            }))
            .onTapGesture {
                focusedTextField = false
            }
            
        }
    }
    private func emptyTextboxDetector() {
        if password == "" {
            isPassword = true
        }else {
            isPassword = false
        }
        if userName == "" {
            isUserName = true
        }else{
            isUserName = false
        }
    }
    
    private func loginValidation(){
        
        for user in register {
            if user.username == userName && user.password == password{
                validationPassword = true
                deafults.setValue("\(user.username!)", forKey: "userName")
                return
            }
        }
        isWrongUsernamePassword = true
        validationPassword = false
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
