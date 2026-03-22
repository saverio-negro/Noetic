//
//  OnboardingCompletedView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        VStack {
            Text("Onboarding Completed!")
                .frame(maxHeight: .infinity)
            
            Button {
                // Finish onboarding and enter app
                onFinishButtonPressed()
            } label: {
                // Call-to-action button
                Text("Finish")
                    .callToActionButton()
                    
            }
        }
        .padding(15)
    }
    
    func onFinishButtonPressed() {
        // Logic to complete onboarding
        self.appState.finishOnboarding()
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}

