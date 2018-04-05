//
//  KeyPlayer.swift
//  PianoPlay
//
//  Created by Vikram Work/School on 4/4/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import Foundation
import AVFoundation

class KeyPlayer {

   var keyPlayers : [AVAudioPlayer]?
   let noteResourceNames = ["cNote.wav", "dNote.wav", "eNote.wav", "fNote.wav",
                            "gNote.wav", "aNote.wav", "bNote.wav", "cNote.wav",
                            "cSharpNote.wav", "eFlatNote.wav", "fSharpNote.wav",
                            "gSharpNote.wav", "bFlatNote.wav", "cSharpNote.wav"]

   init()   {
      keyPlayers = [AVAudioPlayer]()
      createAudioPlayers()
   }

   func createAudioPlayers()  {
      for index in 0...13   {
         do {
            let audioFile = Bundle.main.url(forResource: noteResourceNames[index], withExtension: nil)
            let ap1 = try AVAudioPlayer(contentsOf: audioFile!)
            ap1.setVolume(1, fadeDuration: 0.5)
            keyPlayers?.append(ap1)
         }  catch {
            print(error.localizedDescription)
         }
      }
   }

}

