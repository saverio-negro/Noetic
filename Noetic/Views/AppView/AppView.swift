//
//  AppView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/8/26.
//

import SwiftUI

// Root View that routes between the `TabView` (Signed in) and `OnboardingView (Signed out)
struct AppView: View {
    
    @State var appState: AppState = AppState()
    
    var body: some View {
        
        AppViewBuilder(
            isSignedIn: appState.isSignedIn,
            tabBarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView — TabBar") {
    AppView(appState: AppState(isSignedIn: true))
}

#Preview("AppView — Onboarding") {
    AppView(appState: AppState(isSignedIn: false))
}

