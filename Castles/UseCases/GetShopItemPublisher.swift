//
//  GetShopItemPublisher.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation
import Combine

protocol GetshopItemPublisher {
  func execute() -> AnyPublisher<[ShopItem], Never>
}

final class GetShopItemPublisherAdapter: GetshopItemPublisher {
  struct Dependencies {
    var shopService: ShopService = ShopServiceAdapter.shared
  }
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute() -> AnyPublisher<[ShopItem], Never> {
    return dependencies.shopService.shopPublisher
  }
}
