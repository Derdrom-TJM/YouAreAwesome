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
            Button("Show Message") {
                //While Loop
                //                var messageNumber = Int.random(in: 0..<messages.count)
                //
                //                while messageNumber == lastMessageNumber {
                //
                //                    messageNumber = Int.random(in: 0..<messages.count)
                //
                //                }
                
                
//                var messageNumber:Int
//                
//                repeat {
//                    
//                    messageNumber = Int.random(in: 0..<messages.count)
//                    
//                }while messageNumber == lastMessageNumber
                
                
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count)
                message = messages[lastMessageNumber]

                
                
//                var imageNumber:Int
//                repeat {
//                    imageNumber = Int.random(in: 0...numberOfImages - 1)
//                } while imageNumber == lastImageNumber
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages)
                imageName = ("image\(lastImageNumber)")
                
//                var soundNumber:Int
//                repeat {
//                    soundNumber = Int.random(in: 0...numberOfSounds - 1)
//                }while soundNumber == lastSoundNumber
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds)
                soundName = "sound\(lastSoundNumber)"
                
                playSound()
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            //.tint(.orange)
        }
        .padding()
    }
    
    func playSound(){
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
