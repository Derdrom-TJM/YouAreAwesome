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
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName:imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            //.frame(width: 200, height: 200)
            
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            
            Spacer()
            // CMD + A to highlight and Ctrl + i to fix indent
            Button("Press Me") {
                //Could have used else to change it from "" to you are awesome
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
//                if counter % 2 == 0{
//                    message = message1
//                    imageName = imageString1
//                } else {
//                    message = message2
//                    imageName = imageString2
//                }
                
                //Talk about scope as since they don't exist outside the button
                
                message = (counter % 2 == 0 ? message1 : message2 )
                imageName = (counter % 2 == 0 ? imageString1 : imageString2)
                counter += 1
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
