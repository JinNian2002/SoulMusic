//
//  PeopleProfileView.swift
//  SoulMusic
//
//  Created by ZZZS on 21.8.22.
//

import SwiftUI

struct PeopleProfileView: View {
    @Environment(\.colorScheme) var currentMode
    @Binding var peopleprofilemoreshow : Bool
    var body: some View {
        ZStack{
            VStack{
                NavView(isshowfront: false, Navtitle: "Ta的空间")
                HStack{
                    HStack(spacing: 24){
                        Image("profilepic1")
                            .circleImage(width: 72, height: 72)
                        VStack(alignment: .leading, spacing: 10){
                            Text("痴若")
                                .font(.system(size: 18, weight: .black))
                                .foregroundColor(Color("OnSurface"))
                            HStack(spacing: 7){
                                HStack(spacing: 6){
                                    Text("关注")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("OnSurface"))
                                    Text("123")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("FontSecondary"))
                                }
                                HStack(spacing: 6){
                                    Text("粉丝")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("OnSurface"))
                                    Text("12")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("FontSecondary"))
                                }
                                HStack(spacing: 6){
                                    Text("动态")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("OnSurface"))
                                    Text("93")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("FontSecondary"))
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding(12)
                HStack{
                    Text("Ta的作品")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color("OnSurface"))
                    Spacer()
                }
                .padding(.horizontal, 24)
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ForEach(0..<10) { item in
                            SongList(profilemoreshow: $peopleprofilemoreshow)
                            Divider()
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 12)
                }
            }
            if peopleprofilemoreshow{
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation (.easeIn(duration: 0.25)){
                            peopleprofilemoreshow = false
                        }
                    }
            }
            ProfileMoreView(profilemoreshow: $peopleprofilemoreshow)
                .offset(y: peopleprofilemoreshow ? 0 : 323.7)
            .ignoresSafeArea()
        }
    }
}

struct PeopleProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleProfileView(peopleprofilemoreshow: .constant(false))
            .environmentObject(ClientData(FromOutMyClient: initMyClientData()))
    }
}
