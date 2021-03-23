//
//  ContentView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    
    // MARK: Computed Properties
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Picker {
                        
                    }
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
