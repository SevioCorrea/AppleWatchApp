//
//  DetailView.swift
//  AppleWatchApp Watch App
//
//  Created by Sévio Basilio Corrêa on 06/07/23.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditPresent: Bool = false
    @State private var isSettingsPresent: Bool = false

    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // Header
            HeaderView(title: "")
            
            // Content
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // Footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresent.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresent) {
                        SettingsView()
                    }
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresent.toggle()
                    }
                    .sheet(isPresented: $isCreditPresent, content: {
                        CreditView()
                    })
                
            } //: HStack
            .foregroundColor(.secondary)
            
        } //: VStack
        .padding(3)
    }
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello, World!")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
