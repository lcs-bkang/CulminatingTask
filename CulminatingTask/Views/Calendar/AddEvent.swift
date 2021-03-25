//
//  AddEvent.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct AddEvent: View {
    @Binding var showThisView: Bool
    
    
    var body: some View {
        NavigationView {
            
            Text("Add Event")
                
                .navigationTitle("Add Event")
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

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent(showThisView: .constant(true))
    }
}
