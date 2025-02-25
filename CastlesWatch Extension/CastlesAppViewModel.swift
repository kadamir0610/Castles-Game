//
//  CastlesAppViewModel.swift
//  CastlesWatch Extension
//
//  Created by admin on 2022-03-20.
//

import Foundation

final class CastlesAppViewModel: ObservableObject {
  struct Dependencies {
    var startPhoneSession: StartPhoneSession = StartPhoneSessionAdapter()
  }
  
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
    self.dependencies.startPhoneSession.execute()
  }
}
