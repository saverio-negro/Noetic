//
//  UserDefaults+HasCompletedOnboarding.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

extension UserDefaults {
    
    static var hasCompletedOnboarding: Bool {
        
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasCompletedOnboarding)
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.hasCompletedOnboarding)
        }
    }
}
