//
//  SoundManager.swift
//  Swothie
//
//  Created by Passavee Losripat on 20/2/2567 BE.
//

import AVFoundation

class BackgroundMusicManager {
    static let shared = BackgroundMusicManager()
    private var musicPlayer1: AVAudioPlayer?
    private var musicPlayer2: AVAudioPlayer?

    init() {
        setupAudioPlayer(&musicPlayer1, fileName: "level0", fileType: "mp3")
        setupAudioPlayer(&musicPlayer2, fileName: "EpicBGM", fileType: "mp3")
    }

    private func setupAudioPlayer(_ player: inout AVAudioPlayer?, fileName: String, fileType: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileType) else {
            print("\(fileName).\(fileType) not found.")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.prepareToPlay()
        } catch {
            print("Failed to initialize AVAudioPlayer for \(fileName): \(error)")
        }
    }

    func playMusic(musicNumber: Int) {
        switch musicNumber {
        case 1:
            musicPlayer2?.stop()
            musicPlayer1?.play()
            
        case 2:
            musicPlayer1?.stop()
            musicPlayer2?.play()
            
        default:
            print("Invalid music number.")
        }
    }

    func stopMusic() {
        musicPlayer1?.stop()
        musicPlayer2?.stop()
    }
}
