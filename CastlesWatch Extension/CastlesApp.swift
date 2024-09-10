//
//  CastlesApp.swift
//  CastlesWatch Extension
//
//  Created by admin on 2022-03-20.
//

import SwiftUI

@main
struct CastlesApp: App {
  @StateObject var viewModel = CastlesAppViewModel()
  
  @SceneBuilder var body: some Scene {
    WindowGroup {
      NavigationView {
        DashboardView(viewModel: DashboardViewModel())
      }
    }
    
    WKNotificationScene(controller: NotificationController.self, category: "myCategory")
  }
}
