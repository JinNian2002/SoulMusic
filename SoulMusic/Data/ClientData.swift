//
//  ClientData.swift
//  SoulMusic
//
//  Created by ZZZS on 26.8.22.
//

import Foundation
import SwiftUI
import Parse

var encoder = JSONEncoder()
var decoder = JSONDecoder()

func initMyClientData() -> Client{
    var output : Client = Client(username: "", email: "", sex: "", constellation: "", age: "", location: "", job: "", introduction: "", clientimage: Data())
    if let datastore = UserDefaults.standard.object(forKey: "MyClient") as? Data{
        let data = try! decoder.decode(Client.self, from: datastore)
        output = data
    }
    return output
}

class ClientData : ObservableObject{
    @Published var MyClient : Client
    @Published var saveresult = false
    
    init(FromOutMyClient : Client){
        self.MyClient = FromOutMyClient
    }
    
    func datastore(){
        let datastore = try! encoder.encode(self.MyClient)
        UserDefaults.standard.set(datastore, forKey: "MyClient")
    }
    
    func ServerSave(ChangeName: String, ChangeContent: String) {
        var query = PFUser.query()
        query?.whereKey("username", equalTo: self.MyClient.username)
        query?.findObjectsInBackground{ user, error in
            if(error != nil){
                print("错误！")
            }else if let user = user{
                user[0][ChangeName] = ChangeContent
                user[0].saveInBackground { success, error in
                    self.saveresult = success
                }
            }
        }
    }
    
    func ServerSaveImage(ChangeName: String, ChangeContent: Data) {
        var query = PFUser.query()
        query?.whereKey("username", equalTo: self.MyClient.username)
        query?.findObjectsInBackground{ user, error in
            if(error != nil){
                print("错误！")
            }else if let user = user{
                let imagefile = PFFileObject(name: "image.jpg", data: ChangeContent)!
                user[0][ChangeName] = imagefile
                user[0].saveInBackground { success, error in
                    self.saveresult = success
                }
            }
        }
    }
}

struct Client : Identifiable, Decodable, Encodable{
    var id = UUID()
    var username : String
    var email : String
    var sex : String
    var constellation : String
    var age : String
    var location : String
    var job : String
    var introduction : String
    var clientimage : Data
}
