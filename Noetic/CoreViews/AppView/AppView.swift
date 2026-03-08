//
//  AppView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/8/26.
//

import SwiftUI

// Root View that routes between the `TabView` (Signed in) and `OnboardingView (Signed out)
struct AppView: View {
    
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    var body: some View {
        
        AppViewBuilder(
            isSignedIn: $isSignedIn,
            signedInView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Show Tabbar")
                }
            },
            signedOutView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding View")
                }
            }
        )
        .onTapGesture {
            isSignedIn.toggle()
        }
    }
}

#Preview("AppView — Signed In") {
    AppView(isSignedIn: true)
}

#Preview("AppView — Signed Out") {
    AppView(isSignedIn: false)
}

