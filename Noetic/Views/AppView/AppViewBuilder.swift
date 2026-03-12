//
//  AppViewBuilder.swift
//  Noetic
//
//  Created by Saverio Negro on 3/8/26.
//

import SwiftUI

struct AppViewBuilder<SignedInView: View, SignedOutView: View>: View {
    
    @Binding var isSignedIn: Bool
    @ViewBuilder var signedInView: SignedInView
    @ViewBuilder var signedOutView: SignedOutView
    
    var body: some View {
        ZStack {
            if isSignedIn {
                self.signedInView
                    .transition(AnyTransition.move(edge: .trailing))
            } else {
                self.signedOutView
                    .transition(AnyTransition.move(edge: .leading))
            }
        }
        .animation(.smooth, value: isSignedIn)
    }
}

fileprivate struct PreviewView: View {
    
    @State private var isSignedIn: Bool = false
    
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

#Preview {
    PreviewView()
}
