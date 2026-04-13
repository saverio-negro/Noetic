//
//  Constants.swift
//  Noetic
//
//  Created by Saverio Negro on 4/13/26.
//

import Foundation

struct Constants {
    static let randomImage = "https://picsum.photos/600/600"
    static var appImage: String {
        return Bundle.main.url(forResource: "NoeticIcon", withExtension: "png")?.absoluteString ?? randomImage
    }
    static let termsOfService = "https://www.apple.com"
    static let privacyPolicyURL = "https://www.apple.com"
}

