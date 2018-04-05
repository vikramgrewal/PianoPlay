//
//  ViewController.swift
//  PianoPlay
//
//  Created by Vikram Work/School on 4/3/18.
//  Copyright © 2018 Vikram Work/School. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   @IBOutlet weak var keyC: UIButton!
   @IBOutlet weak var keyD: UIButton!
   @IBOutlet weak var keyE: UIButton!
   @IBOutlet weak var keyF: UIButton!
   @IBOutlet weak var keyG: UIButton!
   @IBOutlet weak var keyA: UIButton!
   @IBOutlet weak var keyB: UIButton!
   @IBOutlet weak var keyOctaveC: UIButton!
   @IBOutlet weak var cSharpNote: UIButton!
   @IBOutlet weak var eFlatNote: UIButton!
   @IBOutlet weak var fSharpNote: UIButton!
   @IBOutlet weak var gSharpNote: UIButton!
   @IBOutlet weak var bFlatNote: UIButton!
   @IBOutlet weak var octaveCSharpNote: UIButton!

   var keyPlayer : KeyPlayer!

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.

      keyPlayer = KeyPlayer()

      addAllGestureRecognizers()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }


   func addGestureRecognizer(key: UIButton)  {
      let tap = UILongPressGestureRecognizer(target: self, action: #selector(keyTapped(_:)))
      tap.minimumPressDuration = 0
      key.isUserInteractionEnabled = true
      key.addGestureRecognizer(tap)
      key.layer.borderColor = UIColor.black.cgColor
      key.layer.borderWidth = 1
   }

   @objc func keyTapped(_ sender: UITapGestureRecognizer)  {
      if let pressedView = sender.view as? UIButton {

         let keyToPress = pressedView.tag
         if sender.state == UIGestureRecognizerState.began   {
            if keyToPress >= 0 && keyToPress <= 7 {
               pressedView.backgroundColor = UIColor(red:0.87, green:0.87,
                                                     blue:0.87, alpha:1.0)
            }  else if keyToPress >= 8 && keyToPress <= 13 {
               pressedView.backgroundColor = UIColor(red:0.21, green:0.21,
                                                     blue:0.21, alpha:1.0)
            }
            let keyPlayers = keyPlayer.keyPlayers!
            let currentPlayer = keyPlayers[keyToPress]
            if currentPlayer.isPlaying {
               currentPlayer.pause()
            }
            currentPlayer.currentTime = 0
            currentPlayer.play()
         }  else if sender.state == UIGestureRecognizerState.ended   {
            if keyToPress >= 0 && keyToPress <= 7 {
               pressedView.backgroundColor = UIColor.white
            }  else if keyToPress >= 8 && keyToPress <= 13 {
               pressedView.backgroundColor = UIColor.black
            }
         }

      }
   }

   func addAllGestureRecognizers()  {
      addGestureRecognizer(key: keyC)
      addGestureRecognizer(key: keyD)
      addGestureRecognizer(key: keyE)
      addGestureRecognizer(key: keyF)
      addGestureRecognizer(key: keyG)
      addGestureRecognizer(key: keyA)
      addGestureRecognizer(key: keyB)
      addGestureRecognizer(key: keyOctaveC)
      addGestureRecognizer(key: cSharpNote)
      addGestureRecognizer(key: eFlatNote)
      addGestureRecognizer(key: fSharpNote)
      addGestureRecognizer(key: gSharpNote)
      addGestureRecognizer(key: bFlatNote)
      addGestureRecognizer(key: octaveCSharpNote)
   }

}

