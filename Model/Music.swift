//
//  Music.swift
//  twofold
//
//  Created by Allen Boynton on 2/21/19.
//  Copyright © 2019 Allen Boynton. All rights reserved.
//

import AVFoundation

// Global references
var bgMusic: AVAudioPlayer?
var winnerAudio1: AVAudioPlayer?
var musicIsOn = true

class Music {
    
    // MARK: Sound files
    func startGameMusic(name: String) {
        // BG music
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3")!)
        
        do {
            bgMusic = try AVAudioPlayer(contentsOf: url)
            bgMusic?.prepareToPlay()
            bgMusic?.play()
            bgMusic?.numberOfLoops = -1
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
    }
    
    func playWinnerAudio1() {
        // Winning music
        let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: "fanfare", ofType: "mp3")!)
        
        do {
            winnerAudio1 = try AVAudioPlayer(contentsOf: url)
            winnerAudio1?.prepareToPlay()
            winnerAudio1?.play()
            winnerAudio1?.numberOfLoops = 0
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
    }
}

extension Music {
    // Pause sound during ads
    func handleMuteMusic(clip: AVAudioPlayer?) {
        // Pause sound if on
        if musicIsOn {
            // pauses music
            clip?.pause()
            winnerAudio1?.stop()
            musicIsOn = false
        } else {
            clip?.play()
            musicIsOn = true
        }
    }
}
