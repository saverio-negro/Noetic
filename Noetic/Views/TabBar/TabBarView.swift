//
//  TabBarView.swift
//  Noetic
//
//  Created by Saverio Negro on 3/12/26.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            Tab {
                ExploreView()
            } label: {
                Label("Explore", systemImage: "eyes")
            }
            
            Tab {
                ChatsView()
            } label: {
                Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
            }
            
            Tab {
                ProfileView()
            } label: {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    TabBarView()
}
