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
//PicCarddata后续适用于所有类型卡片，由type控制。
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
    var type: String
}
struct Remarkdata : Identifiable{
    var id: Int
    var image: String
    var username: String
    var text: String
    var time: String
}
struct Notdata : Identifiable{
    var id: Int
    var image: String
    var username: String
    var text: String
    var time: String
}
struct Circledata : Identifiable{
    var id: Int
    var image : String
    var title : String
    var text : String
}
struct Albumdata : Identifiable{
    var id: Int
    var image : String
    var albumname : String
    var singername : String
}
struct Songlistdata : Identifiable{
    var id: Int
    var image : String
    var songlistname : String
    var authorname : String
}
struct Mysongdata : Identifiable{
    var id: Int
    var image : String
    var songname : String
    var myname : String
}


enum Selection{
    case listen
    case musiclibrary
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
    PicCarddata(id: 0, image: "profilepic1", username: "痴若", time: "今天 18:06", text: "最近找到的比较好看的一张图片，就放下面了。", pic: "listentoobject", sharenum: 13, messagenum: 235, heartnum: 525, heart: false, type: "pic"),
    PicCarddata(id: 1, image: "profilepic2", username: "人生一场梦", time: "昨天 8:06", text: "【folklore】格莱美获奖专辑💽", pic: "album5", sharenum: 18, messagenum: 25, heartnum: 259, heart: false, type: "pic"),
    PicCarddata(id: 2, image: "profilepic3", username: "孙笑川", time: "8月6日 12:26", text: "我从你们那没事了。", pic: "", sharenum: 133, messagenum: 26, heartnum: 245, heart: false, type: "text"),
    PicCarddata(id: 3, image: "profilepic4", username: "清风", time: "7月13日 11:06", text: "故人西辞黄鹤楼，烟花三月下扬州。孤帆远影碧空尽，唯见长江天际流。", pic: "", sharenum: 93, messagenum: 95, heartnum: 251, heart: false, type: "text"),
    PicCarddata(id: 4, image: "profilepic5", username: "瑾年", time: "7月10日 15:34", text: "君不见，黄河之水天上来，奔流到海不复回。\n君不见，高堂明镜悲白发，朝如青丝暮成雪。", pic: "store", sharenum: 113, messagenum: 125, heartnum: 355, heart: false, type: "text"),
    PicCarddata(id: 5, image: "profilepic6", username: "简单", time: "7月11日 15:34", text: "君不见，高堂明镜悲白发，朝如青丝暮成雪。", pic: "store", sharenum: 113, messagenum: 125, heartnum: 355, heart: false, type: "text"),
    PicCarddata(id: 6, image: "profilepic7", username: "令希", time: "7月14日 17:32", text: "用AR文件制作的效果，赶紧来试一下。", pic: "album2", sharenum: 113, messagenum: 125, heartnum: 455, heart: false, type: "ar"),
    PicCarddata(id: 7, image: "profilepic8", username: "一天", time: "7月17日 19:34", text: "君不见，高堂明镜悲白发，朝如青丝暮成雪。", pic: "store", sharenum: 13, messagenum: 12, heartnum: 325, heart: false, type: "ar")
    ]
    var Remarkdatas : [Remarkdata] = [
    Remarkdata(id: 0, image: "profilepic1", username: "JinNian", text: "今朝有酒今朝醉", time: "8月1日"),
    Remarkdata(id: 1, image: "profilepic2", username: "C60", text: "我带你们打", time: "8月2日"),
    Remarkdata(id: 2, image: "profilepic3", username: "神勇金雕", text: "孤帆远影碧空尽，唯见长江天际流。", time: "8月2日"),
    Remarkdata(id: 3, image: "profilepic4", username: "大黑牛", text: "我带你们打", time: "8月2日"),
    Remarkdata(id: 4, image: "profilepic5", username: "大方🤔", text: "故人西辞黄鹤楼，烟花三月下扬州。", time: "8月2日"),
    Remarkdata(id: 5, image: "profilepic6", username: "官方活动", text: "君不见，黄河之水天上来，奔流到海不复回。\n君不见，高堂明镜悲白发，朝如青丝暮成雪。", time: "8月2日")
    ]
    var Notdatas : [Notdata] = [
        Notdata(id: 0, image: "profilepic1", username: "JinNian", text: "今朝有酒今朝醉", time: "8月1日"),
        Notdata(id: 1, image: "profilepic2", username: "C60", text: "我带你们打", time: "8月2日"),
        Notdata(id: 2, image: "profilepic3", username: "神勇金雕", text: "孤帆远影碧空尽，唯见长江天际流。", time: "8月2日"),
        Notdata(id: 3, image: "profilepic4", username: "大黑牛", text: "我带你们打", time: "8月2日"),
        Notdata(id: 4, image: "profilepic5", username: "大方🤔", text: "故人西辞黄鹤楼，烟花三月下扬州。", time: "8月2日"),
        Notdata(id: 5, image: "profilepic6", username: "官方活动", text: "君不见，黄河之水天上...", time: "8月2日"),
        Notdata(id: 6, image: "profilepic7", username: "多个地方", text: "今朝有酒今朝醉", time: "8月1日"),
        Notdata(id: 7, image: "profilepic8", username: "较高的", text: "我带你们打", time: "8月2日"),
        Notdata(id: 8, image: "profilepic9", username: "适合发呆", text: "孤帆远影碧空尽，唯见长江天际流。", time: "8月2日"),
        Notdata(id: 9, image: "profilepic10", username: "恢复", text: "我带你们打", time: "8月2日"),
        Notdata(id: 10, image: "profilepic11", username: "古诗", text: "故人西辞黄鹤楼，烟花三月下扬州。", time: "8月2日")
    ]
    var Circledatas : [Circledata] = [
    Circledata(id: 0, image: "circle1", title: "编辑精选", text: "聆听Frank Ocean的专辑《Blond》。"),
    Circledata(id: 1, image: "album2", title: "新专辑", text: "The Weeknd最新专辑《Dawn FM》。"),
    Circledata(id: 2, image: "album7", title: "新单曲", text: "Ariana Grande新单曲《Positions》。"),
    Circledata(id: 3, image: "songlist3", title: "推荐歌单", text: "全球精选伤感情歌，只为度过难熬的夜晚。"),
    Circledata(id: 4, image: "album4", title: "今日最佳", text: "《Melodrama》中的关键曲目Supercut。"),
    Circledata(id: 5, image: "album5", title: "最多人听", text: "超亿播放量《folklore》顺势斩下格莱美！")
    ]
    var Albumdatas : [Albumdata] = [
    Albumdata(id: 0, image: "album1", albumname: "无时无刻", singername: "李健"),
    Albumdata(id: 1, image: "album2", albumname: "Dawn FM", singername: "The Weeknd"),
    Albumdata(id: 2, image: "album3", albumname: "30", singername: "Adele"),
    Albumdata(id: 3, image: "album4", albumname: "Melodrama", singername: "Lorde"),
    Albumdata(id: 4, image: "album5", albumname: "folklore", singername: "Taylor Swift"),
    Albumdata(id: 5, image: "album6", albumname: "自本", singername: "曹雅雯"),
    Albumdata(id: 6, image: "album7", albumname: "Positions", singername: "Ariana Grande")
    ]
    var Songlistdatas : [Songlistdata] = [
        Songlistdata(id: 0, image: "songlist1", songlistname: "2022年欧美热曲", authorname: "烟柳"),
        Songlistdata(id: 1, image: "songlist2", songlistname: "2022格莱美", authorname: "JinNian"),
        Songlistdata(id: 2, image: "songlist3", songlistname: "伤感情歌", authorname: "JinNian"),
        Songlistdata(id: 3, image: "songlist4", songlistname: "爱国金曲", authorname: "WANG"),
        Songlistdata(id: 4, image: "songlist5", songlistname: "减压良曲", authorname: "WANG"),
        Songlistdata(id: 5, image: "songlist6", songlistname: "入梦好曲", authorname: "WANG"),
        Songlistdata(id: 6, image: "songlist7", songlistname: "情歌精选", authorname: "WANG")
    ]
    var Mysongdatas : [Mysongdata] = [
    Mysongdata(id: 0, image: "listentoobject", songname: "Longtime", myname: ""),
    Mysongdata(id: 1, image: "listentoobject", songname: "Max", myname: ""),
    Mysongdata(id: 2, image: "listentoobject", songname: "Dream", myname: ""),
    Mysongdata(id: 3, image: "listentoobject", songname: "Element", myname: ""),
    Mysongdata(id: 4, image: "listentoobject", songname: "Think", myname: ""),
    Mysongdata(id: 5, image: "listentoobject", songname: "T.Y.", myname: ""),
    Mysongdata(id: 6, image: "listentoobject", songname: "One Last Time", myname: "")
    ]
    var Songsdata : [Mysongdata] = [
    Mysongdata(id: 0, image: "album5", songname: "folklore", myname: "Taylor Swift"),
    Mysongdata(id: 1, image: "album2", songname: "Dawn FM", myname: "The Weeknd"),
    Mysongdata(id: 2, image: "album1", songname: "无时无刻", myname: "李健"),
    Mysongdata(id: 3, image: "album3", songname: "I Drink Wine", myname: "Adele"),
    Mysongdata(id: 4, image: "album4", songname: "Supercut", myname: "Lorde"),
    Mysongdata(id: 5, image: "album6", songname: "瘾头", myname: "曹雅雯"),
    Mysongdata(id: 6, image: "album7", songname: "Positions", myname: "Ariana Grande"),
    Mysongdata(id: 7, image: "album2", songname: "Gasoline", myname: "The Weeknd"),
    Mysongdata(id: 8, image: "album5", songname: "the 1", myname: "Taylor Swift"),
    Mysongdata(id: 9, image: "album6", songname: "借问一下", myname: "曹雅雯")
    ]
    var Albumsongsdata : [Mysongdata] = [
    Mysongdata(id: 0, image: "blonde", songname: "Nikes", myname: "Frank Ocean"),
    Mysongdata(id: 1, image: "blonde", songname: "Ivy", myname: "Frank Ocean"),
    Mysongdata(id: 2, image: "blonde", songname: "Pink+White", myname: "Frank Ocean"),
    Mysongdata(id: 3, image: "blonde", songname: "Be Yourself", myname: "Frank Ocean"),
    Mysongdata(id: 4, image: "blonde", songname: "Solo", myname: "Frank Ocean"),
    Mysongdata(id: 5, image: "blonde", songname: "Skyline To", myname: "Frank Ocean"),
    Mysongdata(id: 6, image: "blonde", songname: "Self Control", myname: "Frank Ocean"),
    Mysongdata(id: 7, image: "blonde", songname: "Good Guy", myname: "Frank Ocean"),
    Mysongdata(id: 8, image: "blonde", songname: "Nights", myname: "Frank Ocean"),
    Mysongdata(id: 9, image: "blonde", songname: "Solo(Reprise)", myname: "Frank Ocean"),
    Mysongdata(id: 10, image: "blonde", songname: "Pretty Sweet", myname: "Frank Ocean"),
    Mysongdata(id: 11, image: "blonde", songname: "Facebook Story", myname: "Frank Ocean"),
    Mysongdata(id: 12, image: "blonde", songname: "Close to You", myname: "Frank Ocean"),
    Mysongdata(id: 13, image: "blonde", songname: "White Ferrari", myname: "Frank Ocean"),
    Mysongdata(id: 14, image: "blonde", songname: "Seigfried", myname: "Frank Ocean"),
    Mysongdata(id: 15, image: "blonde", songname: "Godspeed", myname: "Frank Ocean"),
    Mysongdata(id: 16, image: "blonde", songname: "Futura Free", myname: "Frank Ocean")
    ]
}
