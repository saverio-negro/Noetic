//
//  AppViewBuilder.swift
//  Noetic
//
//  Created by Saverio Negro on 3/8/26.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnBoardingView: View>: View {
    
    let hasCompletedOnboarding: Bool
    @ViewBuilder var tabBarView: TabBarView
    @ViewBuilder var onboardingView: OnBoardingView
    
    var body: some View {
        ZStack {
            if hasCompletedOnboarding {
                self.tabBarView
                    .transition(AnyTransition.move(edge: .trailing))
            } else {
                self.onboardingView
                    .transition(AnyTransition.move(edge: .leading))
            }
        }
        .animation(.smooth, value: hasCompletedOnboarding)
    }
}

fileprivate struct PreviewView: View {
    
    @State var appState: AppState = AppState(hasCompletedOnboarding: false)
    
    var body: some View {
        
        AppViewBuilder(
            hasCompletedOnboarding: appState.hasCompletedOnboarding,
            tabBarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Show Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding View")
                }
            }
        )
        .onTapGesture {
            appState.hasCompletedOnboarding ? appState.restartOnboarding() : appState.finishOnboarding()
        }
    }
}

#Preview {
    PreviewView()
}
