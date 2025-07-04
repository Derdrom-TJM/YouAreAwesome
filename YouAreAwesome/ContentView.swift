//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Todd McFarlin on 1/13/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundName = ""
    @State private var imageCounter = 0
    @State private var messages = ["You Are Awesome",
                                   "You Are Great",
                                   "Fabulous? That's You",
                                   "You Are A Swifty Now",
                                   "Keep It Rocking!", "You will be the Greatest App Developer in History"]
    //    @State private var messageCounter = 0
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer:AVAudioPlayer!
    @State private var soundIsOn = true
    
    let numberOfImages = 10
    let numberOfSounds = 6
    
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            
            
            
            Spacer()
            HStack {
                Text("Sound On:")
                Toggle("Sound On:", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying{
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    
                    
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count)
                    message = messages[lastMessageNumber]
                    
                    
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages)
                    imageName = ("image\(lastImageNumber)")
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds)
                    soundName = "sound\(lastSoundNumber)"
                    
                    if soundIsOn{
                        playSound()
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            //.tint(.orange)
        }
        .padding()
    }
    
    func playSound(){
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
            
        } catch{
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayyer")
        }
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int{
        var newNumber:Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds - 1)
        } while newNumber == lastImageNumber
        return newNumber
    }
}

//Great Loops program for 1.14 in forLoops Playground

#Preview {
    ContentView()
}
