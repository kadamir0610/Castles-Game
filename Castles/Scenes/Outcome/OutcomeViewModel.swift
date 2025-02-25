//
//  OutcomeViewModel.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import Foundation

enum OutcomeEntryType {
  case attackChange(value: String)
  case defeneseChange(value: String)
  case affectedCastle(imageName: String, name: String)
  case hpChange(value: String)
  case castleDestroyed(text: String)
  case loot(value: String)
}

final class OutcomeViewModel {
  private let outcome: Outcome
  var title: String {
    switch outcome {
    case .plunder:
      return "Attacked by Barbarians"
    case .attack:
      return "Loot Obtained"
    case .fortify:
      return "Castle Fortified"
    case .attackPerkUsed:
      return "Used Smith Perk"
    case .goldPerkUsed:
      return "Harvest Collected!"
    }
  }
  
  init(outcome: Outcome) {
    self.outcome = outcome
  }
  
  func getEntries() -> [OutcomeEntryType] {
    switch outcome {
    case let .attack(castle: castle, attackDecrease: attackDecrease, loot: loot):
      return attackEntries(castle: castle, attackDecrease: attackDecrease, loot: loot)
    case let .fortify(castle: castle, defenseIncrease: defenseIncrease, attackIncrease: attackIncrease, hpIncrease: hpIncrease):
      return fortifyEntries(castle: castle, defenseIncrease: defenseIncrease, attackIncrease: attackIncrease, hpIncrease: hpIncrease)
    case let .plunder(castle: castle, defenseDecrease: defenseDecrease, hpDecrease: hpDecrease, isCastleDestroyed: isCastleDestroyed):
      return plunderEntries(castle: castle, defenseDecrease: defenseDecrease, hpDecrease: hpDecrease, isCastleDestroyed: isCastleDestroyed)
    case let .attackPerkUsed(castle: castle, attackIncrease: attackIncrease):
      return attackPerkEntries(castle: castle, attackIncrease: attackIncrease)
    case let .goldPerkUsed(goldIncrease: goldIncrease):
      return harvestPerkEntries(goldIncrease: goldIncrease)
    }
  }
}

private extension OutcomeViewModel {
  func fortifyEntries(castle: Castle, defenseIncrease: Int, attackIncrease: Int, hpIncrease: Int) -> [OutcomeEntryType] {
    return [
      .affectedCastle(imageName: castle.imageName, name: "\(castle.name) fortified!"),
      .defeneseChange(value: "+ \(defenseIncrease)"),
      .attackChange(value: "+ \(attackIncrease)"),
      .hpChange(value: "+ \(hpIncrease)")
    ]
  }
  
  func plunderEntries(castle: Castle, defenseDecrease: Int, hpDecrease: Int, isCastleDestroyed: Bool) -> [OutcomeEntryType] {
    var entries: [OutcomeEntryType] = [
      .affectedCastle(imageName: castle.imageName, name: "\(castle.name) plundered!"),
      .defeneseChange(value: "- \(defenseDecrease)"),
      .hpChange(value: "- \(hpDecrease)")
    ]
    if isCastleDestroyed {
      entries.append(.castleDestroyed(text: "\(castle.name) was lost!"))
    }
    return entries
  }
  
  func attackEntries(castle: Castle, attackDecrease: Int, loot: Int) -> [OutcomeEntryType] {
    return [
      .affectedCastle(imageName: castle.imageName, name: "\(castle.name) collected loot!"),
      .attackChange(value: "- \(attackDecrease)"),
      .loot(value: "\(loot)")
    ]
  }
  
  func attackPerkEntries(castle: Castle, attackIncrease: Int) -> [OutcomeEntryType] {
    return [
      .affectedCastle(imageName: castle.imageName, name: "\(castle.name) attack increased"),
      .attackChange(value: "+ \(attackIncrease)")
    ]
  }
  
  func harvestPerkEntries(goldIncrease: Int) -> [OutcomeEntryType] {
    return [
      .loot(value: "Earned \(goldIncrease) from this harvest!")
    ]
  }
}
