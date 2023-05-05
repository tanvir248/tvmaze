//
//  profileDetailsView.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI
import CoreData
struct profileDetailsView: View {
    @State private var name: String = ""
    @State private var userName: String = " "
    @State private var phone: String = ""
    @State var password: String = "tanvir123"
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var profiles: FetchedResults<Users>
    @Environment(\.dismiss) var dismiss
    let deafults = UserDefaults.standard
    var body: some View {
        NavigationView {
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 15){
                    
                    Text("**Name**: \(name)")
                    Text("**User Name**: \(userName)")
                    Text("**Phone Number**: \(phone)")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary, lineWidth: 2)
                )
                Spacer()
                Button{
                    dismiss()
                }label: {
                    largeButton(text: "Back", color: .gray)
                }
                Spacer()
            }
            
            .navigationTitle("Profile Details")
            .onAppear{
                profileValidation()
            }
        }
        
    }
    private func profileValidation(){
        
        for users in profiles {
            
            if users.username == deafults.string(forKey: "userName") {
                userName = users.username ?? "Not Found"
                name = users.name ?? "Not Found"
                phone = users.phoneNo ?? "Not Found"
                
                return
            }
        }
    }
}

struct profileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        profileDetailsView()
    }
}
