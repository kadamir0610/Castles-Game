//
//  Outcome.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation

enum Outcome {
  case fortify(castle: Castle, defenseIncrease: Int, attackIncrease: Int, hpIncrease: Int)
  case plunder(castle: Castle, defenseDecrease: Int, hpDecrease: Int, isCastleDestroyed: Bool)
  case attack(castle: Castle, attackDecrease: Int, loot: Int)
  case goldPerkUsed(goldIncrease: Int)
  case attackPerkUsed(castle: Castle, attackIncrease: Int)
}

