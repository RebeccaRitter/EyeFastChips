//
//  MemoryGameDelegate.swift
//  twofold
//
//  Created by Allen Boynton on 2/21/19.
//  Copyright © 2019 Allen Boynton. All rights reserved.
//

import Foundation

// MARK: - MemoryGameDelegate

protocol GameDelegate {
    func memoryGameDidStart(_ game: MemoryGame)
    func memoryGame(_ game: MemoryGame, showCards cards: [Card])
    func memoryGame(_ game: MemoryGame, hideCards cards: [Card])
    func memoryGameDidEnd(_ game: MemoryGame, elapsedTime: TimeInterval)
}
