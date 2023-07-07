//
//  CreditView.swift
//  AppleWatchApp Watch App
//
//  Created by Sévio Basilio Corrêa on 07/07/23.
//

import SwiftUI

struct CreditView: View {
    // MARK: - Properties
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }

    // MARK: - Body
    var body: some View {
        VStack(spacing: 3) {
            // Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("Sévio")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        } //: VStack
    }
}

// MARK: - Preview

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
