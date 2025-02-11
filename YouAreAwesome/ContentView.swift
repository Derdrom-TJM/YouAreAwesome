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
            
            HStack {
                Button("Press Me") {
                    
                    if counter % 2 == 0{
                        message = "You are Awesome!"
                        imageName = "sun.max.fill"
                    } else {
                        message = "You are Great!"
                        imageName = "hand.thumbsup"
                    }
                    counter += 1
                    }

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
