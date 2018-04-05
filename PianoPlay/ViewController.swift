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

   @IBOutlet weak var stackView: UIStackView!
   @IBOutlet weak var keyC: UIButton!, keyD: UIButton!, keyE: UIButton!
   @IBOutlet weak var keyF: UIButton!, keyG: UIButton!, keyA: UIButton!
   @IBOutlet weak var keyB: UIButton!, keyOctaveC: UIButton!

   var keyPlayer : KeyPlayer!

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.

      keyPlayer = KeyPlayer()

      setUpKey(key: keyC, tag: 8)
      setUpKey(key: keyD, tag: 9)
      setUpKey(key: keyF, tag: 10)
      setUpKey(key: keyG, tag: 11)
      setUpKey(key: keyA, tag: 12)
      setUpKey(key: keyOctaveC, tag: 13)

      addAllGestureRecognizers()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   func setUpKey(key : UIButton, tag: Int)  {
      let buttonHeight = UIScreen.main.bounds.height / 2
      let buttonWidth = key.bounds.width / 2
      let buttonXPos = (20 / 2 ) + (key.frame.origin.x + key.bounds.width) - (buttonWidth / 2)
      let buttonFrame = CGRect(x: buttonXPos, y: 0, width: buttonWidth, height: buttonHeight)
      let button = UIButton(frame: buttonFrame)
      button.backgroundColor = UIColor.black
      button.isUserInteractionEnabled = true
      button.tag = tag
      addGestureRecognizer(key: button)
      view.addSubview(button)
   }

   func addGestureRecognizer(key: UIButton)  {
      let tap = UILongPressGestureRecognizer(target: self, action: #selector(keyTapped(_:)))
      tap.minimumPressDuration = 0
      key.isUserInteractionEnabled = true
      key.addGestureRecognizer(tap)
   }

   @objc func keyTapped(_ sender: UITapGestureRecognizer)  {
      if let pressedView = sender.view as? UIButton {

         let keyToPress = pressedView.tag
         if sender.state == UIGestureRecognizerState.began   {
            if keyToPress >= 0 && keyToPress <= 7 {
               pressedView.backgroundColor = UIColor(red:0.96, green:0.96,
                                                     blue:0.96, alpha:1.0)
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
   }

}

