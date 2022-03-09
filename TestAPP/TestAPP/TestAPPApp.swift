//
//  TestAPPApp.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 06/03/2022.
//

import SwiftUI

@main
struct TestAPPApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
