//
//  ShopItemPresenter.swift
//  Castles
//
//  Created by admin on 2022-03-20.
//

import UIKit

final class ShopItemPresenter {
  func viewModel(for shopItem: ShopItem) -> ShopItemViewModel {
    return shopItem.wrappedItem.accept(visitor: self, data: shopItem)
  }
}

extension ShopItemPresenter: ItemVisitor {
  func visit(castleItem: CastleItem, data shopItem: ShopItem) -> ShopItemViewModel {
    let castlePresenter = CastleItemPresenter()
    return castlePresenter.viewModel(for: castleItem, shopItem: shopItem)
  }
}
