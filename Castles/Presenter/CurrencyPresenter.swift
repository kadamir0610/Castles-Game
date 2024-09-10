//
//  CurrencyPresenter.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import UIKit

final class CurrencyPresenter {
  static func goldString(_ gold: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 0
    return numberFormatter.string(from: NSNumber(value: gold)) ?? "0"
  }
}
