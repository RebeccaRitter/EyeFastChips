//
//  MemoryGame.swift
//  twofold
//
//  Created by Allen Boynton on 2/21/19.
//  Copyright © 2019 Allen Boynton. All rights reserved.
//

import Foundation
import UIKit.UIImage
import Darwin

class MemoryGame {
    
    // MARK: - Properties
    var cards: [Card] = [Card]()
    var delegate: GameDelegate?
    var isPlaying: Bool = false
    
    fileprivate var cardsShown: [Card] = [Card]()
    fileprivate var startTime: Date?
    
    // Gets number of cards
    var numberOfCards: Int {
        get {
            return cards.count
        }
    }
    
    // Calculates time passed
    var elapsedTime: TimeInterval {
        get {
            guard startTime != nil else {
                return -1
            }
            return Date().timeIntervalSince(startTime!)
        }
    }
    
    // MARK: - Methods
    
    // Operations to start off a new game
    func newGame(_ cardsData: [UIImage]) {
        cards = randomCards(cardsData)
        startTime = Date.init()
        isPlaying = true
        delegate?.memoryGameDidStart(self)
    }
    
    // Operations when game has been stopped
    func stopGame() {
        isPlaying = false
        cards.removeAll()
        cardsShown.removeAll()
        startTime = nil
    }
    
    // Function to determine shown unpaired and paired cards
    func didSelectCard(_ card: Card?) {
        guard let card = card else { return }
        
        delegate?.memoryGame(self, showCards: [card])
        
        // If cards are not a match
        if unpairedCardShown() {
            let unpaired = unpairedCard()!
            if card.equals(unpaired) {
                cardsShown.append(card)
            } else {
                let unpairedCard = cardsShown.removeLast()
                
                let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    self.delegate?.memoryGame(self, hideCards: [card, unpairedCard])
                }
            }
        } else {
            // If cards are a match
            cardsShown.append(card)
        }
        
        // Adjusts remaining cards. If none -> finish the game
        if cardsShown.count == cards.count {
            finishGame()
        }
    }
    
    // Helps assign cards and adjusts card index
    func cardAtIndex(_ index: Int) -> Card? {
        if cards.count > index {
            return cards[index]
        } else {
            return nil
        }
    }
    
    func indexForCard(_ card: Card) -> Int? {
        for index in 0...cards.count - 1 {
            if card === cards[index] {
                return index
            }
        }
        return nil
    }
    
    // Determines if game is being played and if not...capture time
    fileprivate func finishGame() {
        // Game Over methods
        isPlaying = false
        delegate?.memoryGameDidEnd(self, elapsedTime: elapsedTime)
    }
    
    // Matches cards with same value using remainder
    fileprivate func unpairedCardShown() -> Bool {
        return cardsShown.count % 2 != 0
    }
    
    // Assigns card to be assigned with a match
    fileprivate func unpairedCard() -> Card? {
        let unpairedCard = cardsShown.last
        return unpairedCard
    }
    
    /*************************************** Random Images ***********/
    
    // Pick random cards for game board
    fileprivate func randomCards(_ cardsData:[UIImage]) -> [Card] {
        var cards = [Card]()
        if cardsData.count > 0 {
            for i in 0...cardsData.count - 1 {
                let card = Card.init(image: cardsData[i])
                cards.append(contentsOf: [card, Card.init(card: card)])
            }
        }
        return cards.shuffled()
    }
}

// Mark: - ************** Future gen?CardImages **************
extension MemoryGame {

    static var stickmen: [UIImage] = [
        UIImage(named: "1")!, UIImage(named: "2")!,         UIImage(named: "3")!,  UIImage(named: "4")!,  UIImage(named: "5")!,  UIImage(named: "6")!,     UIImage(named: "7")!,  UIImage(named: "8")!, UIImage(named: "9")!,  UIImage(named: "10")!, UIImage(named: "11")!, UIImage(named: "12")!, UIImage(named: "13")!, UIImage(named: "14")!, UIImage(named: "15")!, UIImage(named: "16")!, UIImage(named: "17")!, UIImage(named: "18")!, UIImage(named: "19")!, UIImage(named: "20")!
    ]
    
    static var butterflies: [UIImage] = [
        UIImage(named: "21")!, UIImage(named: "22")!,    UIImage(named: "23")!, UIImage(named: "24")!, UIImage(named: "25")!, UIImage(named: "26")!, UIImage(named: "27")!, UIImage(named: "28")!, UIImage(named: "29")!, UIImage(named: "30")!, UIImage(named: "31")!, UIImage(named: "32")!, UIImage(named: "33")!, UIImage(named: "34")!, UIImage(named: "35")!, UIImage(named: "36")!, UIImage(named: "37")!
    ]
    
    static var beach: [UIImage] = [
        UIImage(named: "41")!, UIImage(named: "42")!,    UIImage(named: "43")!, UIImage(named: "44")!, UIImage(named: "45")!, UIImage(named: "46")!, UIImage(named: "47")!, UIImage(named: "48")!, UIImage(named: "49")!, UIImage(named: "50")!, UIImage(named: "51")!, UIImage(named: "52")!, UIImage(named: "53")!, UIImage(named: "54")!, UIImage(named: "55")!, UIImage(named: "56")!, UIImage(named: "57")!
    ]
    
    static var jungle: [UIImage] = [
        UIImage(named: "61")!, UIImage(named: "62")!,    UIImage(named: "63")!, UIImage(named: "64")!, UIImage(named: "65")!, UIImage(named: "66")!, UIImage(named: "67")!, UIImage(named: "68")!, UIImage(named: "69")!, UIImage(named: "70")!, UIImage(named: "71")!, UIImage(named: "72")!, UIImage(named: "73")!, UIImage(named: "74")!
    ]
    
    
    static var fighter: [UIImage] = [
        UIImage(named: "79")!, UIImage(named: "80")!,    UIImage(named: "81")!, UIImage(named: "82")!, UIImage(named: "83")!, UIImage(named: "84")!, UIImage(named: "85")!, UIImage(named: "86")!, UIImage(named: "87")!, UIImage(named: "88")!, UIImage(named: "89")!, UIImage(named: "90")!, UIImage(named: "91")!, UIImage(named: "92")!, UIImage(named: "93")!, UIImage(named: "94")!, UIImage(named: "95")!
    ]
    
    static var clothes: [UIImage] = [
        UIImage(named: "96")!, UIImage(named: "97")!,    UIImage(named: "98")!,  UIImage(named: "99")!, UIImage(named: "100")!, UIImage(named: "101")!, UIImage(named: "102")!, UIImage(named: "103")!, UIImage(named: "104")!, UIImage(named: "105")!, UIImage(named: "106")!, UIImage(named: "107")!, UIImage(named: "108")!, UIImage(named: "109")!
    ]
    
    static var heroes: [UIImage] = [
        UIImage(named: "110")!, UIImage(named: "111")!,     UIImage(named: "112")!, UIImage(named: "113")!, UIImage(named: "114")!, UIImage(named: "115")!, UIImage(named: "116")!, UIImage(named: "117")!, UIImage(named: "118")!, UIImage(named: "119")!, UIImage(named: "120")!, UIImage(named: "121")!, UIImage(named: "122")!, UIImage(named: "123")!, UIImage(named: "124")!, UIImage(named: "125")!, UIImage(named: "126")!, UIImage(named: "127")!
    ]
    
    static var food: [UIImage] = [
        UIImage(named: "128")!, UIImage(named: "129")!,  UIImage(named: "130")!, UIImage(named: "131")!, UIImage(named: "132")!, UIImage(named: "133")!, UIImage(named: "134")!, UIImage(named: "135")!, UIImage(named: "136")!, UIImage(named: "137")!, UIImage(named: "138")!, UIImage(named: "139")!, UIImage(named: "140")!, UIImage(named: "141")!, UIImage(named: "142")!, UIImage(named: "143")!
    ]
    
    static var city: [UIImage] = [
        UIImage(named: "144")!, UIImage(named: "145")!,  UIImage(named: "146")!, UIImage(named: "147")!, UIImage(named: "148")!, UIImage(named: "149")!, UIImage(named: "150")!, UIImage(named: "151")!, UIImage(named: "152")!, UIImage(named: "153")!, UIImage(named: "154")!, UIImage(named: "155")!, UIImage(named: "156")!, UIImage(named: "157")!, UIImage(named: "158")!, UIImage(named: "159")!, UIImage(named: "160")!, UIImage(named: "161")!, UIImage(named: "162")!
    ]
    
    
    static var wedding: [UIImage] = [
        UIImage(named: "163")!, UIImage(named: "164")!,  UIImage(named: "165")!, UIImage(named: "166")!, UIImage(named: "167")!, UIImage(named: "168")!, UIImage(named: "169")!, UIImage(named: "170")!, UIImage(named: "171")!, UIImage(named: "172")!, UIImage(named: "173")!, UIImage(named: "174")!, UIImage(named: "175")!, UIImage(named: "176")!, UIImage(named: "177")!
    ]
    
    static var animal: [UIImage] = [
        UIImage(named: "178")!, UIImage(named: "179")!,  UIImage(named: "180")!, UIImage(named: "181")!, UIImage(named: "182")!, UIImage(named: "183")!, UIImage(named: "184")!, UIImage(named: "185")!, UIImage(named: "186")!, UIImage(named: "187")!, UIImage(named: "188")!, UIImage(named: "189")!, UIImage(named: "190")!, UIImage(named: "191")!, UIImage(named: "192")!, UIImage(named: "193")!, UIImage(named: "194")!, UIImage(named: "195")!
    ]
    
    
    static var people: [UIImage] = [
        UIImage(named: "196")!, UIImage(named: "197")!,  UIImage(named: "198")!, UIImage(named: "199")!, UIImage(named: "200")!, UIImage(named: "201")!, UIImage(named: "202")!, UIImage(named: "203")!, UIImage(named: "204")!, UIImage(named: "205")!, UIImage(named: "206")!, UIImage(named: "207")!, UIImage(named: "208")!, UIImage(named: "209")!, UIImage(named: "210")!, UIImage(named: "211")!
    ]
    
    static var gen4Images: [UIImage] = [
        UIImage(named: "test")!
    ]
    
    static var gen5Images: [UIImage] = [
        
    ]
    
    static var gen6Images: [UIImage] = [
        
    ]
    
    static var gen7Images: [UIImage] = [
        
    ]
}
