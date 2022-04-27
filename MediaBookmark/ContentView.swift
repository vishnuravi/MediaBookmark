//
//  ContentView.swift
//  MediaBookmark
//
//  Created by Vishnu Ravi on 4/27/22.
//

import SwiftUI
import MediaPlayer

struct ContentView: View {
    
    @State var title: String = ""
    @State var timestamp: Double = 0.0
    
    func createBookmark() {
        let musicPlayer = MPMusicPlayerController.systemMusicPlayer
        
        if let nowPlayingItem = musicPlayer.nowPlayingItem,
           let title = nowPlayingItem.title {
            self.title = title
            self.timestamp = musicPlayer.currentPlaybackTime
        } else {
            print("Nothing playing.")
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Bookmarked \(title) at \(timestamp)")
            Spacer()
            Button("Another Bookmark"){
                createBookmark()
            }
            Spacer()
        }.onAppear {
            createBookmark()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
