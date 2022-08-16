//
//  Data.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import Foundation
import SwiftUI

struct Tabdata : Identifiable{
    var id: Int
    var tabtext: String
}

struct PicCarddata : Identifiable{
    var id: Int
    var image: String
    var username: String
    var time: String
    var text: String
    var pic: String
    var sharenum: Int
    var messagenum: Int
    var heartnum: Int
    var heart: Bool
}
enum Selection{
    case listen
    case musiclibrary
    case arcommunity
    case message
    case profile
}
class Model : ObservableObject{
    @Published var select: Selection = .listen
    var Tabdatas : [Tabdata] = [
    Tabdata(id: 0, tabtext: "推荐"),
    Tabdata(id: 1, tabtext: "关注"),
    Tabdata(id: 2, tabtext: "旅游"),
    Tabdata(id: 3, tabtext: "动漫"),
    Tabdata(id: 4, tabtext: "娱乐"),
    Tabdata(id: 5, tabtext: "电影"),
    Tabdata(id: 6, tabtext: "游戏")
    ]
    var PicCarddatas : [PicCarddata] = [
    PicCarddata(id: 0, image: "profilepic1", username: "痴若", time: "18:06", text: "最近找到的比较好看的一张图片，就放下面了。", pic: "store", sharenum: 13, messagenum: 235, heartnum: 525, heart: false),
    PicCarddata(id: 1, image: "profilepic2", username: "人生一场梦", time: "8:06", text: "【图片集锦】家养小动物的美照", pic: "store", sharenum: 18, messagenum: 25, heartnum: 259, heart: false),
    PicCarddata(id: 2, image: "profilepic3", username: "孙笑川", time: "12:26", text: "我从你们那没事了。", pic: "store", sharenum: 133, messagenum: 26, heartnum: 245, heart: false),
    PicCarddata(id: 3, image: "profilepic4", username: "清风", time: "11:06", text: "故人西辞黄鹤楼，烟花三月下扬州。孤帆远影碧空尽，唯见长江天际流。", pic: "store", sharenum: 93, messagenum: 95, heartnum: 251, heart: false),
    PicCarddata(id: 4, image: "profilepic5", username: "瑾年", time: "15:34", text: "君不见，黄河之水天上来，奔流到海不复回。                君不见，高堂明镜悲白发，朝如青丝暮成雪。", pic: "store", sharenum: 113, messagenum: 125, heartnum: 355, heart: false),
    ]
}
