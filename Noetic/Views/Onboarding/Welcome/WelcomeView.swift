//
//  WelcomeView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/12/26.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var imageName: String = Constants.appImage
    
    init(imageName: String = Constants.randomImage) {
        self.imageName = imageName
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Spacer()
                logoSection
                    .foregroundStyle(.accent)
                
                Spacer()
                
                ctaButtons
                    .padding(16)
                
                policyLinks
            }
        }
    }
    
    private var logoSection: some View {
        VStack(spacing: 0) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 200, height: 200)
            
            VStack(spacing: 8) {
                Text("Noetic")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Inner Wisdom at Hand")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }
            
            Text("Already have an account? Sign in.")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {
                    
                }
        }
    }
    
    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(
                destination: URL(string: Constants.termsOfService)!
            ) {
                Text("Terms of Service")
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            Link(
                destination: URL(string: Constants.privacyPolicyURL)!
            ) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
        .environment(AppState())
}
