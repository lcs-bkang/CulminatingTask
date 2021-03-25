//
//  AddEvent.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct AddCity: View {
    
    @Binding var showThisView: Bool
    
    var body: some View {
        NavigationView {
            
            Text("Add City")
                
                .navigationTitle("Add City")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Done") {
                            hideView()
                    }
                }
            }
        }
    }
    
    // MARK: Functions
    func hideView() {
        return showThisView = false
    }
}

struct AddCity_Previews: PreviewProvider {
    static var previews: some View {
        AddCity(showThisView: .constant(true))
    }
}
