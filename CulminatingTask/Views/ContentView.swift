//
//  ContentView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    
    // Variable to choose when to stop showing the loading screen
    @State var showApp: Bool = false
    
    // Initialize a timer that will fire in one second
    let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
    // MARK: Computed Properties
    
    var body: some View {
        if showApp {
            AppView()
        } else {
        NavigationView {
            Text("Loading...")
                .font(.largeTitle)
                .onReceive(timer) { input in
                
                // Set the flag to enable animations
                    showApp = true
                
                // Stop the timer from continuing to fire
                timer.upstream.connect().cancel()
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
