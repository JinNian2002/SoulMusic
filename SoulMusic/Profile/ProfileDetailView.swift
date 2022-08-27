//
//  ProfileDetailView.swift
//  SoulMusic
//
//  Created by ZZZS on 26.8.22.
//

import SwiftUI
import Parse

struct ProfileDetailView: View {
    @State var array1 : [String] = ["用户名","邮箱", "性别","星座","年龄","地区","职业","简介"]
    @State var array2 : [String] = ["瑾年","1316755935@qq.com", "男","天蝎座","20","成都","学生","你好，我叫瑾年。"]
    @Binding var clientimage : String
    @State var showimagepicker = false
    @State var imagedata = Data()
    @Environment(\.colorScheme) var currentMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var MyClientdata : ClientData
    
    var body: some View {
        VStack{
            HStack{
                Image(currentMode == .dark ? "chevron_24_back_dm" : "chevron_24_back")
                    .padding(12)
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
                Text("编辑资料")
                    .font(.system(size: 17, weight: .medium))
                Spacer()
                Text("保存")
                    .foregroundColor(.red)
                    .padding(.horizontal, 4)
                    .onTapGesture {
                        //存入云端
                        MyClientdata.ServerSave(ChangeName: "username", ChangeContent: MyClientdata.MyClient.username)
                        MyClientdata.ServerSave(ChangeName: "email", ChangeContent: MyClientdata.MyClient.email)
                        MyClientdata.ServerSave(ChangeName: "sex", ChangeContent: MyClientdata.MyClient.sex)
                        MyClientdata.ServerSave(ChangeName: "age", ChangeContent: MyClientdata.MyClient.age)
                        MyClientdata.ServerSave(ChangeName: "constellation", ChangeContent: MyClientdata.MyClient.constellation)
                        MyClientdata.ServerSave(ChangeName: "location", ChangeContent: MyClientdata.MyClient.location)
                        MyClientdata.ServerSave(ChangeName: "introduction", ChangeContent: MyClientdata.MyClient.introduction)
                        MyClientdata.ServerSaveImage(ChangeName: "clientimage", ChangeContent: imagedata)
                        //存入本地
                        MyClientdata.MyClient.username = array2[0]
                        MyClientdata.MyClient.email = array2[1]
                        MyClientdata.MyClient.sex = array2[2]
                        MyClientdata.MyClient.constellation = array2[3]
                        MyClientdata.MyClient.age = array2[4]
                        MyClientdata.MyClient.location = array2[5]
                        MyClientdata.MyClient.job = array2[6]
                        MyClientdata.MyClient.introduction = array2[7]
                        //存入内存
                        MyClientdata.datastore()
                        //返回上一级
                        dismiss()
                    }
            }
            ScrollView{
                VStack(spacing: 0){
                    MyAsyncImage(url: URL(string: MyClientdata.MyClient.clientimage)!) {
                        ProgressView()
                    } image: { UIImage in
                        Image(uiImage: UIImage)
                    }
                        .overlay(
                            Button{
                                showimagepicker = true
                            }label: {
                                HStack{
                                    Image("camera")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 18)
                                }
                                .circleIcon(width: 30, height: 30)
                            }
                            .opacity(0.8)
                            .offset(x: 35, y: 35)
                        )
                        .padding(.bottom, 48)
                        .padding(.top, 24)
                    ForEach(0..<array1.count) { item in
                        VStack(spacing: 0){
                            HStack{
                                Text(array1[item])
                                    .foregroundColor(Color("FontSecondary"))
                                Spacer()
                                TextField(text: $array2[item]) {
                                    Text(array2[item])
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.7)
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 24)
                            Divider()
                        }
                        
                    }
                }
                
                
            }
        }
        .sheet(isPresented: $showimagepicker, onDismiss: {
            if(!imagedata.isEmpty){
//                MyClientdata.MyClient.clientimage = imagedata
                MyClientdata.ServerSaveImage(ChangeName: "clientimage", ChangeContent: imagedata)
                MyClientdata.datastore()
            }
        }, content: {
            Imagepicker(ispicker: $showimagepicker, imagedata: $imagedata)
        })
    }
}
