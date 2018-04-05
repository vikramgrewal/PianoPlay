# PianoPlay

### Introduction
> This is an IOS application that allows users to play a piano from your Iphone/Ipad using all keys of an actual piano C-C. 

### Project Information
> PianoPlay was created using a Model-View-Controller design pattern. The view was created using a large amount of
AutoLayout, so it adapts regardless of the screen size. I learned many useful Xcode design tools using that create beautifully adaptive layouts. The model for the view was the KeyPlayer which allowed me to remove the logic of playing sounds from our view controller. The controller took care of all the gestures for the presses of the keys. I encountered issues with UITapGestureRecognizer for when holding keys, so I had to look for a more suitable option. IOS comes with a useful gesture UILongPressGestureRecognizer which allows you to take care of the keys being held since it allows us to access the state of these presses `UIGestureRecognizerState.began` and `UIGestureRecognizerState.ended`. 

### Issues Encountered
> When working with AVAudioPlayer, I encountered issues with the player not being able to play multiple sounds. This was a case where a singleton couldn't be used. Instead I instantiated one AVAudioPlayer for each sound of the keys, so I created a helper class called KeyPlayer which holds an array of each of these Audio Players. I also didn't want to create arrays of all the views to find out which key was pressed. To resolve this situation I quickly found about tags for UIViews. This was useful since I could make each tag the identifier corresponding to the index element of the audio player in the array of audio players. Another relatively small bug that I encountered, but I managed to fix was the player not smoothly restarting since the AVAudioPlayer does not take care of this logic using the solution below.
```
if currentPlayer.isPlaying {
    currentPlayer.pause()
}
currentPlayer.currentTime = 0
currentPlayer.play()
```
### Installation
> Xcode is required to open this project. Download or clone the repository to your system. Open PianoPlay.xcodeproj either from terminal when in the root directory using ```open PianoPlay.xcodeproj/ -a Xcode``` or from your finder window. Change the bundle identifier and the development team. 
