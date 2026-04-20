//
//  OnboardingCompletedView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var appState
    @State private var isCompletingProfileSetup: Bool = false
    
    let selectedColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            
            Text("We've set up your profile and you are ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            
            
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(
            edge: .bottom,
            alignment: .center,
            spacing: 16,
            content: {
                ctaButton
            }
        )
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var ctaButton: some View {
        Button {
            onFinishButtonPressed()
        } label: {
            ZStack {
                if (isCompletingProfileSetup) {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")
                }
            }
            .callToActionButton()
        }
        .disabled(isCompletingProfileSetup)
    }
    
    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        
        Task {
            do {
                // Save user's profile data to database
                try await saveUserProfile(color: selectedColor)
                
                isCompletingProfileSetup = false
                
                // Complete onboarding (sign user in) if user's data
                // was successfully saved
                appState.signIn()
            } catch {
                // Error while saving data for user's profile
                print("Error: \(error.localizedDescription)")
                isCompletingProfileSetup = false
            }
        }
    }
    
    func saveUserProfile(color: Color) async throws {
        
        // Fake 15% error rate
        let errorChance = 0.15
        
        if (Double.random(in: 0..<1) <= errorChance) {
            throw URLError(.badServerResponse)
        }
        
        try? await Task.sleep(for: .seconds(3))
    }
}

#Preview {
    OnboardingCompletedView(selectedColor: .accent)
        .environment(AppState())
}

