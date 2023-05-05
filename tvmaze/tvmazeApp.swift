//
//  tvmazeApp.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI

@main
struct tvmazeApp: App {
    let registrationController = registrationDataController()

    var body: some Scene {
        WindowGroup {
            loginView()
                .environment(\.managedObjectContext, registrationController.container.viewContext)
        }
    }
}
