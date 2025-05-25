//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Todd McFarlin on 1/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageCounter = 0
    @State private var messages = ["You Are Awesome",
                                   "You Are Great",
                                   "Fabulous? That's You",
                                   "You Are A Swifty Now",
                                   "Keep It Rocking!", "You will be the Greatest App Developer in History"]
//    @State private var messageCounter = 0
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
    
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
                
                
                var messageNumber:Int

                repeat {

                    messageNumber = Int.random(in: 0..<messages.count)

                }while messageNumber == lastMessageNumber
                
                message = messages[messageNumber]
                lastMessageNumber = messageNumber

                

                var imageNumber:Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
                imageName = ("image\(imageNumber)")
            }
            
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
            //.tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
