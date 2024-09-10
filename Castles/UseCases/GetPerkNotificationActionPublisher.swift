//
//  GetPerkNotificationActionPublisher.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation
import Combine

protocol GetPerkNotificationActionPublisher {
  func execute() -> AnyPublisher<PerkIdentifier, Never>
}

final class GetPerkNotificationActionPublisherAdapter: GetPerkNotificationActionPublisher {
  struct Dependencies {
    var notificationService: NotificationService = NotificationServiceAdapter.shared
  }
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute() -> AnyPublisher<PerkIdentifier, Never> {
    return dependencies.notificationService.perkUseNotificationPublisher
  }
}
