//
//  AppState.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

@Observable
class AppState {
    
    private(set) var hasCompletedOnboarding: Bool {
        didSet {
            UserDefaults.hasCompletedOnboarding = hasCompletedOnboarding
        }
    }
    
    init(hasCompletedOnboarding: Bool = UserDefaults.hasCompletedOnboarding) {
        self.hasCompletedOnboarding = hasCompletedOnboarding
    }
    
    func finishOnboarding() {
        self.hasCompletedOnboarding = true
    }
    
    func restartOnboarding() {
        self.hasCompletedOnboarding = false
    }
}
