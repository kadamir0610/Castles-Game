//
//  CastleEffect.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation
import SpriteKit

protocol CastleEffect {
  func getEffectFor(condition: CastleViewModel.Condition) -> SKNode?
}

final class CastleEffectAdapter: CastleEffect {
  func getEffectFor(condition: CastleViewModel.Condition) -> SKNode? {
    switch condition {
    case .onFire:
      return SKNode(fileNamed: "CastleFire.sks")
    case .perfect:
      return SKNode(fileNamed: "SparklingCastle.sks")
    default:
      return nil
    }
  }
}
