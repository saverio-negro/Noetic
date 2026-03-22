//
//  View+CallToActionButton.swift
//  Noetic
//
//  Created by Saverio Negro on 3/22/26.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        return self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent, in: RoundedRectangle(cornerRadius: 16))
    }
}

