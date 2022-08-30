//
//  NewSongsListView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/30.
//

import SwiftUI

struct NewSongsListView: View {
    @Binding var profilemoreshow : Bool
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0){
                VStack{
                    SongList(profilemoreshow: $profilemoreshow, songname: "Positions", singername: "Ariana Grande", image: "album7")
                    Divider()
                    SongList(profilemoreshow: $profilemoreshow, songname: "无时无刻", singername: "李健", image: "album1")
                    Divider()
                    SongList(profilemoreshow: $profilemoreshow, songname: "folklore", singername: "Taylor Swift", image: "album5")
                }
                .frame(width: UIScreen.main.bounds.width - 60)
                .padding(.leading, 24)
                VStack{
                    SongList(profilemoreshow: $profilemoreshow, songname: "Dawn FM", singername: "The Weeknd", image: "album2")
                    Divider()
                    SongList(profilemoreshow: $profilemoreshow, songname: "I Drink Wine", singername: "Adele", image: "album3")
                    Divider()
                    SongList(profilemoreshow: $profilemoreshow, songname: "Supercut", singername: "Lorde", image: "album4")
                }
                .frame(width: UIScreen.main.bounds.width - 60)
                .padding(.leading, 24)
            }
            .padding(.trailing, 36)
        }
    }
}
