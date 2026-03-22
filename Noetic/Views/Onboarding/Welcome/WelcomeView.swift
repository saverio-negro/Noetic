//
//  WelcomeView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/12/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome!")
                    .frame(maxHeight: .infinity)
                
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    
                    // Call-to-action button
                    Text("Get Started")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .padding(15)
        }
    }
}

#Preview {
    WelcomeView()
}
