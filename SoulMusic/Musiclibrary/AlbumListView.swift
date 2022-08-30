//
//  AlbumListView.swift
//  SoulMusic
//
//  Created by 文静 on 2022/8/30.
//

import SwiftUI

struct AlbumListView: View {
    @EnvironmentObject var Musicdatas : Model
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(Musicdatas.Albumdatas) { item in
                    NavigationLink{
                        AlbumDetailView()
                            .navigationBarHidden(true)
                    }label: {
                        AlbumView(image: item.image, albumname: item.albumname, singername: item.singername)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

struct SongListView: View {
    @EnvironmentObject var Musicdatas : Model
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(Musicdatas.Songlistdatas) { item in
                    NavigationLink{
                        AlbumDetailView()
                            .navigationBarHidden(true)
                    }label: {
                        AlbumView(image: item.image, albumname: item.songlistname, singername: item.authorname)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

struct AlbumView : View {
    @State var isselect = false
    var image : String
    var albumname : String
    var singername : String
    var body: some View{
        VStack(alignment: .leading, spacing: 4){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 4 + 10, height: UIScreen.main.bounds.width / 4 + 10)
                .cornerRadius(6)
                .overlay(
                    VStack(alignment: .trailing){
                        Spacer()
                        HStack{
                            Spacer()
                            Button{
                                isselect.toggle()
                            }label: {
                                HStack{
                                    Image(isselect ? "checkright" : "plus")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                }
                                .frame(width: 30, height: 30, alignment: .center)
                                .background(Color(isselect ? "Primary": "SecondaryContainer"), in: RoundedRectangle(cornerRadius: 50))
                            }
                        }
                    }
                    .padding(5)
                )
            Text(albumname)
                .foregroundColor(Color("OnSurface"))
                .font(.system(size: 14))
            Text(singername)
                .foregroundColor(Color("FontSecondary"))
                .font(.system(size: 12))
        }
    }
}
