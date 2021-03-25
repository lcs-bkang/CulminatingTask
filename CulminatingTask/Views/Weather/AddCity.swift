//
//  AddEvent.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct AddCity: View {
    
    @Binding var showThisView: Bool
    
    @State var Text: String
    
    var body: some View {
        NavigationView {
            
            VStack {
            TextField("City Name", text: $Text)
                .padding(.horizontal, 15.0)
                .border(Color(.gray))
                Spacer()
            }
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
        AddCity(showThisView: .constant(true), Text: "Peterborough")
    }
}
