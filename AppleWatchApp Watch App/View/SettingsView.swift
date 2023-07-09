//
//  SettingsView.swift
//  AppleWatchApp Watch App
//
//  Created by Sévio Basilio Corrêa on 09/07/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @AppStorage("lineCount") var lineCount: Int = 1

    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            // Header
            HeaderView(title: "Settings")
            
            // Actual Line Count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // Slider
        } //: vStack
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
