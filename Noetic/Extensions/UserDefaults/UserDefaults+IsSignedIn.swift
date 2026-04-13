//
//  UserDefaults+isSignedIn.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

extension UserDefaults {
    
    static var isSignedIn: Bool {
        
        get {
            return UserDefaults.standard.bool(forKey: Keys.isSignedIn)
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.isSignedIn)
        }
    }
}
