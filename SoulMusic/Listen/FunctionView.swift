//
//  FunctionView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI

struct FunctionView: View {
    var body: some View {
        HStack(alignment: .center){
            NavigationLink{
                CameraView()
                    .navigationBarHidden(true)
            }label: {
                VStack{
                    Text("聆物")
                        .font(.system(size: 24, weight: .medium))
                        
                }
                .frame(width: UIScreen.main.bounds.width / 2 - 32.5, height: UIScreen.main.bounds.width / 2 - 32.5, alignment: .center)
                .foregroundColor(.white)
                .background(Image("listentoobject").resizable().aspectRatio(contentMode: .fill))
                .cornerRadius(12)
                .clipped()
                .padding(4)
                .background(Color("Primary"))
                .cornerRadius(14)
            }
            
            Spacer()
            VStack{
                HStack{
                    VStack{
                        Text("听天气")
                            .font(.system(size: 18, weight: .medium))
                            
                    }
                    .frame(width: UIScreen.main.bounds.width / 4 - 20.5, height: UIScreen.main.bounds.width / 4 - 20.5, alignment: .center)
                    .foregroundColor(.white)
                    .background(Image("listentoweather").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(6)
                    .clipped()
                    .padding(2)
                    .background(Color("Primary"))
                    .cornerRadius(8)
                    Spacer()
                    VStack{
                        Text("听地点")
                            .font(.system(size: 18, weight: .medium))
                            
                    }
                    .frame(width: UIScreen.main.bounds.width / 4 - 20.5, height: UIScreen.main.bounds.width / 4 - 20.5, alignment: .center)
                    .foregroundColor(.white)
                    .background(Image("listentoplace").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(6)
                    .clipped()
                    .padding(2)
                    .background(Color("Primary"))
                    .cornerRadius(8)
                }
                Spacer()
                HStack{
                    VStack{
                        Text("商城")
                            .font(.system(size: 18, weight: .medium))
                            
                    }
                    .frame(width: UIScreen.main.bounds.width / 4 - 20.5, height: UIScreen.main.bounds.width / 4 - 20.5, alignment: .center)
                    .foregroundColor(.white)
                    .background(Image("store").resizable().aspectRatio(contentMode: .fill))
                    .cornerRadius(6)
                    .clipped()
                    .padding(2)
                    .background(Color("Primary"))
                    .cornerRadius(8)
                    Spacer()
                    VStack{
                        Text("更多")
                            .font(.system(size: 18, weight: .medium))
                            
                    }
                    .frame(width: UIScreen.main.bounds.width / 4 - 20.5, height: UIScreen.main.bounds.width / 4 - 20.5, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color("SecondaryContainer"))
                    .cornerRadius(6)
                    .clipped()
                    .padding(2)
                    .background(Color("Primary"))
                    .cornerRadius(8)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 22)
    }
}

struct FunctionView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionView()
    }
}
