//
//  Signpage.swift
//  SoulMusic
//
//  Created by ZZZS on 23.8.22.
//

import SwiftUI

struct Signpage: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("Signpage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                VStack{
                    Spacer()
                    VStack(spacing: 12){
                        Image("Logo_text")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3)
                        Text("高山流水，难遇知音")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Spacer()
                    VStack(spacing: 24){
                        NavigationLink{
                            Signin()
                                .navigationBarHidden(true)
                        }label: {
                            HStack{
                                Spacer()
                                Text("登 录")
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .background(Color("Primary"),in: RoundedRectangle(cornerRadius: 50))
                        }
                        NavigationLink{
                            Signup()
                                .navigationBarHidden(true)
                        }label: {
                            HStack{
                                Spacer()
                                Text("注 册")
                                Spacer()
                            }
                            .padding(.vertical, 12)
                            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 50))
                            .overlay(
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                    .stroke(Color("Primary"), lineWidth: 1)
                            )
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    .foregroundColor(.white)
                    Spacer()
                }
                .background(.ultraThinMaterial)
            }
            .navigationBarHidden(true)
        }
    }
}

struct Signpage_Previews: PreviewProvider {
    static var previews: some View {
        Signpage()
            .environmentObject(Model())
    }
}
