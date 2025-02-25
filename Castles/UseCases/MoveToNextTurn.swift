//
//  MoveToNextTurn.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation

protocol MoveToNextTurn {
  func execute()
}

final class MoveToNextTurnAdapter: MoveToNextTurn {
  struct Dependencies {
    var turnService: TurnService = TurnServiceAdapter.shared
  }
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute() {
    dependencies.turnService.popTurn()
  }
}
