//
//  GetCastlesPublisher.swift
//  CastlesWatch Extension
//
//  Created by admin on 2022-03-20.
//

import Foundation
import Combine

protocol GetCastlesPublisher {
    func execute() -> AnyPublisher<[Castle], Never>
}

final class GetCastlesPublisherAdapter: GetCastlesPublisher {
    struct Dependencies {
        var kingdomService: KingdomService = KingdomServiceAdapter.shared
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
//    private var currentValueCastles = CurrentValueSubject<[Castle], Never>([
//        Castle(castleID: "ID 1", imageName: "castle1", name: "Castle 1", hp: 100, attackPower: 60, defensePower: 30),
//        Castle(castleID: "ID 2", imageName: "castle2", name: "Castle 2", hp: 100, attackPower: 100, defensePower: 40),
//        Castle(castleID: "ID 3", imageName: "castle3", name: "Castle 3", hp: 100, attackPower: 20, defensePower: 50)
//    ])
    
    func execute() -> AnyPublisher<[Castle], Never> {
        dependencies.kingdomService.castlePublisher
//        currentValueCastles.eraseToAnyPublisher()
    }
}
