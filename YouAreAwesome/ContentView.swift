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
    @State private var messageCounter = 0
    
    
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

            //.frame(width: 200, height: 200)
            
            

            
            Spacer()
            // CMD + A to highlight and Ctrl + i to fix indent
            Button("Show Message") {
                //Could have used else to change it from "" to you are awesome
//------1.9 Code Challenge-----------
                
                message = messages[Int.random(in: 0..<messages.count)]

                
//-----------------
//                let message1 = "You are Awesome!"
//                let message2 = "You are Great!"
//                let message3 = "Fabulous? That's You"
//
//                if message == message1{
//                    message = message2
//                }else if message == message2{
//                    message = message3
//                }else {
//                    message = message1
//                }
                
                
                //let imageString1 = "image0"
//                let imageString2 = "image1"
                //removed string literals here and included below
//                if counter % 2 == 0{
//                    message = message1
//                    imageName = imageString1
//                } else {
//                    message = message2
//                    imageName = imageString2
//                }
                
                //Talk about scope as since they don't exist outside the button
                
               //Removing this back to a standard if statement to follow video
                //message = (counter % 2 == 0 ? message1 : message2 )
//                imageName = (counter % 2 == 0 ? "image0" : "image1")
                //my solution before the video.  I was already using a counter anyway
                //TODO: Update the imageName variable

                imageName = "image\(Int.random(in: 0...9))"
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
//Notes for 1.8
//Data types are set by what type of information we store when they are initialized
//Can't change type, option click to see type
//Int - non decimal numbers
//Strint - Text
//Compound operator +=
//show console on Xcode in lower right area debug
//Left variables area, right console
//CMD+K to clear the console
//Breadcrumb code with TODO (top bar/jump bar)
//TODO, FIXME, MARK, use dashes to make it more promeneent
