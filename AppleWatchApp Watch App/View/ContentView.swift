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
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
//        dump(notes)
        
        do {
            // 1. Convert the notes array to data using JSONEnconder
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create a new URL to save the file using the GetDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. Wirte the data to the given URL
            try data.write(to: url)
            
        } catch {
            print("Saving data has failed.")
        }
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
