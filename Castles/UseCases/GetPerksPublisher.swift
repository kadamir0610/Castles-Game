//
//  GetPerksPublisher.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation
import Combine

protocol GetPerksPublisher {
  func execute() -> AnyPublisher<[Perk], Never>
}

final class GetPerksPublisherAdapter: GetPerksPublisher {
  struct Dependencies {
    var perkService: PerkService = PerkServiceAdapter.shared
  }
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute() -> AnyPublisher<[Perk], Never> {
    return dependencies.perkService.perkPublisher
  }
}
