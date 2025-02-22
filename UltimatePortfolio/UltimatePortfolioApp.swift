//
//  UltimatePortfolioAppApp.swift
//  UltimatePortfolioApp
//
//  Created by Alex Garrett on 2/20/25.
//

import SwiftUI

@main
struct UltimatePortfolioAppApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(
                \.managedObjectContext, dataController.container.viewContext
            )
            .environmentObject(dataController)
        }
    }
}
