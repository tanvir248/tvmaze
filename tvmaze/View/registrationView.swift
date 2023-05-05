//
//  registrationView.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI
import CoreData
struct registrationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    
    @State private var isName: Bool = false
    @State private var isUserName: Bool = false
    @State private var isPassowrd: Bool = false
    @State private var isPhone: Bool = false
    
    @FocusState private var focusedTextField: Bool
    var body: some View {
        VStack(spacing: 40){
            Spacer()
            logo()
            Spacer()
            VStack{
                TextField("Name", text: $name)
                    .bigTextField(isRedBorder: isName)
                    .focused($focusedTextField)
                TextField("Username", text: $userName)
                    .bigTextField(isRedBorder: isUserName)
                    .focused($focusedTextField)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .bigTextField(isRedBorder: isPassowrd)
                    .focused($focusedTextField)
                TextField("Phone", text: $phone)
                    .keyboardType(.namePhonePad)
                    .bigTextField(isRedBorder: isPhone)
                    .focused($focusedTextField)
            }
            
            
            Button{
                emptyTextboxDetector()
                if name != "" && userName != "" && password != "" && phone != "" {
                    registrationDataController().addUser(name: name, username: userName, password: password, phoneNo: phone, context: managedObjectContext)
                    dismiss()
                }
            }label: {
                largeButton(text: "Register", color: .green)
            }
            Spacer()
        }.simultaneousGesture(DragGesture().onChanged({ _ in
            focusedTextField = false
        }))
        .onTapGesture {
            focusedTextField = false
        }
        
    }
    private func emptyTextboxDetector() {
        if name == "" {
            isName = true
        }else {
            isName = false
        }
        if userName == "" {
            isUserName = true
        }else{
            isUserName = false
        }
        if password == "" {
            isPassowrd = true
        }else {
            isPassowrd = false
        }
        if phone == "" {
            isPhone = true
        }else {
            isPhone = false
        }
    }
}

struct registrationView_Previews: PreviewProvider {
    static var previews: some View {
        registrationView()
    }
}
