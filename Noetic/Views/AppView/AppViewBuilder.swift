//
//  AppViewBuilder.swift
//  Noetic
//
//  Created by Saverio Negro on 3/8/26.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnBoardingView: View>: View {
    
    let isSignedIn: Bool
    @ViewBuilder var tabBarView: TabBarView
    @ViewBuilder var onboardingView: OnBoardingView
    
    var body: some View {
        ZStack {
            if isSignedIn {
                self.tabBarView
                    .transition(AnyTransition.move(edge: .trailing))
            } else {
                self.onboardingView
                    .transition(AnyTransition.move(edge: .leading))
            }
        }
        .animation(.smooth, value: isSignedIn)
    }
}

fileprivate struct PreviewView: View {
    
    @State var appState: AppState = AppState(isSignedIn: false)
    
    var body: some View {
        
        AppViewBuilder(
            isSignedIn: appState.isSignedIn,
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
            appState.isSignedIn ? appState.signOut() : appState.signIn()
        }
    }
}

#Preview {
    PreviewView()
}
