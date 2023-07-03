//
//  ContentView.swift
//  AppleWatchApp Watch App
//
//  Created by Sévio Basilio Corrêa on 01/07/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    // MARK: - Functions
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new Note", text: $text)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    })
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
//                    .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                } //: HStack
                
                Spacer()
            } //: VStack
            .navigationTitle("Notes")
        } //: Navigation
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
