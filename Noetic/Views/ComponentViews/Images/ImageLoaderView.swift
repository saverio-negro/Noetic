//
//  ImageLoaderView.swift
//  Noetic
//
//  Created by Saverio Negro on 4/13/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    private var urlString: String = Constants.randomImage
    private var resizingMode: ContentMode = .fill
    
    init(
        urlString: String = "https://picsum.photos/600/600",
        resizingMode: ContentMode = .fill
    ) {
        self.urlString = urlString
        self.resizingMode = resizingMode
    }
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
