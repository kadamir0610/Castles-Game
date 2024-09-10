//
//  GetGoldPublisher.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation
import Combine

protocol GetGoldPublisher {
  func execute() -> AnyPublisher<Int, Never>
}

final class GetGoldPublisherAdapter: GetGoldPublisher {
  struct Dependencies {
    var kingdomService: KingdomService = KingdomServiceAdapter.shared
  }
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute() -> AnyPublisher<Int, Never> {
    return dependencies.kingdomService.goldPublisher
  }
}
