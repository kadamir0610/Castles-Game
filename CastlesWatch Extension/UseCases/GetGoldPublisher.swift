//
//  GetGoldPublisher.swift
//  CastlesWatch Extension
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
    //  private var currentValueGold = CurrentValueSubject<Int, Never>(1000)
    
    func execute() -> AnyPublisher<Int, Never> {
        dependencies.kingdomService.goldPublisher
        //    currentValueGold.eraseToAnyPublisher()
    }
}
