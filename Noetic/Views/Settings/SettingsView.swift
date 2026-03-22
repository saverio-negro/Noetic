//
//  SettingsView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func onSignOutPressed() {
        // Logic to sign user out of app
        
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            self.appState.restartOnboarding()
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
