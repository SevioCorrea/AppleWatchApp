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
    func save() {
        dump(notes)
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new Note", text: $text)
                    
                    Button(action: {
                        // 1. Only run the button's action when the text field is not empty
                        guard text.isEmpty == false else { return }
                        
                        // 2. Create a new note item and initialize it the text value
                        let note = Note(id: UUID(), text: text)
                        
                        // 3. Add the new note item to the array (append)
                        notes.append(note)
                        
                        // 4. Make de text field empty
                        text = ""
                        
                        // 5. Save the notes (function)
                        save()
                        
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
                
                Text("\(notes.count)")
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
