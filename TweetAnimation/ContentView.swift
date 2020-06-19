//
//  ContentView.swift
//  TweetAnimation
//
//  Created by ramil on 19.06.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pulsing = false
    @State private var pulsating = false
    @State private var vibrating = false
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            
            Circle()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(Color(.systemGray4))
                .blendMode(.softLight)
            
                .scaleEffect(self.pulsing ? 1 : 1.05, anchor: self.pulsing ? .topTrailing : .bottom)
                .offset(y: self.pulsing ? 2 : -3)
                .animation(Animation.easeIn(duration: 0.1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.pulsing.toggle()
            }
            
            Circle()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(Color(.systemGray4))
                .blendMode(.softLight)
            
                .scaleEffect(self.pulsating ? 1 : 1.05, anchor: self.pulsating ? .bottomLeading : .bottomTrailing)
                    .offset(y: self.pulsating ? 5 : -5)
                    .animation(Animation.easeOut(duration: 0.1).repeatForever(autoreverses: true))
                    .onAppear() {
                        self.pulsating.toggle()
            }
            
            Image("spiral")
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .scaleEffect(self.vibrating ? 1 : 1.05)
                .animation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.vibrating.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
