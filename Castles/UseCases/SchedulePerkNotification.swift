//
//  SchedulePerkNotification.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation

protocol SchedulePerkNotification {
  func execute(perk: Perk)
}

final class SchedulePerkNotificationAdapter: SchedulePerkNotification {
  struct Dependencies {
    var notificationService: NotificationService = NotificationServiceAdapter.shared
  }
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = .init()) {
    self.dependencies = dependencies
  }
  
  func execute(perk: Perk) {
    dependencies.notificationService.scheduleNotification(for: perk)
  }
}
