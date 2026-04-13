//
//  AppState.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

@Observable
class AppState {
    
    private(set) var isSignedIn: Bool {
        didSet {
            UserDefaults.isSignedIn = isSignedIn
        }
    }
    
    init(isSignedIn: Bool = UserDefaults.isSignedIn) {
        self.isSignedIn = isSignedIn
    }
    
    func signIn() {
        self.isSignedIn = true
    }
    
    func signOut() {
        self.isSignedIn = false
    }
}
