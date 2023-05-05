//
//  Persistence.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import CoreData
import Foundation

class registrationDataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "User")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
                
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("data saved")
        }catch {
            print("Could not save data.. \(error.localizedDescription)")
        }
    }
    func addUser(name: String, username: String, password: String, phoneNo: String , context: NSManagedObjectContext) {
        let regData = Users(context: context)
        regData.name = name
        regData.username = username
        regData.password = password
        regData.phoneNo = phoneNo
        save(context: context)
    }
}
