//
//  ContentView.swift
//  SoulMusic
//
//  Created by ZZZS on 15.8.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var currentMode
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var placeholdertext = ""
    @State var isselect = 0
    @State var ontap = false
    @State var  issearch = false
    @State var DragValue : CGFloat = 0.1
    @State var shareshow = false
    @State var moreshow = false
    @State var publishshow = false
    @State var texteditor = ""
    @State var screenbutton = ""
    @State var musicshow = false
    @State var albumname = ""
    @State var noteshow = false
    @State var aria1 = false
    @State var aria2 = false
    @State var aria3 = false
    @State var textfeild1 = ""
    @State var textfeild2 = ""
    @State var textfeild3 = ""
    @State var peopleprofilemoreshow = false
    @State var arshow = false
    @EnvironmentObject var tabdatas : Model
    @EnvironmentObject var piccarddatas : Model
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing: 0){
                    VStack{
                        if DragValue > 0{
                            //搜索栏
                            SearchView(placeholdertext: $placeholdertext, ontap: $ontap, issearch: $issearch, publishshow: $publishshow)
                        }
                        //TabView
                        TabtitleView(isselect: $isselect)
                    }
                    .background(Color("Surface"))
                    .shadow(color: .black.opacity(0.05), radius: 46, y: -4)
                    TabView(selection: $isselect){
                        //Recommend
                        RecommendView(piccarddatas: _piccarddatas, shareshow: $shareshow, moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow)
                            .tag(0)
                        //Focus
                        FocusView(piccarddatas: _piccarddatas, shareshow: $shareshow, moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow)
                            .tag(1)
                        //Travel
                        TravelView(piccarddatas: _piccarddatas, shareshow: $shareshow, moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow)
                        .tag(2)
                        //Comic
                        TravelView(piccarddatas: _piccarddatas, shareshow: $shareshow, moreshow: $moreshow, peopleprofilemoreshow: $peopleprofilemoreshow)
                        .tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .gesture(DragGesture()
                        .onChanged({ dragvalue in
                            withAnimation (.linear(duration: 0.25)){
                                DragValue = dragvalue.translation.height
                            }
                            
                        })
                            .onEnded({ endvalue in
                                withAnimation (.linear(duration: 0.25)){
                                    DragValue = 0
                                }
                            })
                    )
                    //Tabbar
                    TabbarView(arshow: $arshow)
                }
                .background(Color("Background"))
                
                //Menu遮罩
                if ontap{
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                ontap = false
                            }
                        }
                }
                //Menu
                VStack{
                    HStack{
                        MenuView(ontap: $ontap, publishshow: $publishshow, texteditor: $texteditor, screenbutton: $screenbutton, musicshow: $musicshow, albumname: $albumname, noteshow: $noteshow, aria1: $aria1, aria2: $aria2, aria3: $aria3, textfeild1: $textfeild1, textfeild2: $textfeild2, textfeild3: $textfeild3)
                        MenuView(ontap: $ontap, publishshow: $publishshow, texteditor: $texteditor, screenbutton: $screenbutton, musicshow: $musicshow, albumname: $albumname, noteshow: $noteshow, aria1: $aria1, aria2: $aria2, aria3: $aria3, textfeild1: $textfeild1, textfeild2: $textfeild2, textfeild3: $textfeild3)
                    }
                    .hidden()
                    HStack{
                        MenuView(ontap: $ontap, publishshow: $publishshow, texteditor: $texteditor, screenbutton: $screenbutton, musicshow: $musicshow, albumname: $albumname, noteshow: $noteshow, aria1: $aria1, aria2: $aria2, aria3: $aria3, textfeild1: $textfeild1, textfeild2: $textfeild2, textfeild3: $textfeild3)
                        MenuView(ontap: $ontap, publishshow: $publishshow, texteditor: $texteditor, screenbutton: $screenbutton, musicshow: $musicshow, albumname: $albumname, noteshow: $noteshow, aria1: $aria1, aria2: $aria2, aria3: $aria3, textfeild1: $textfeild1, textfeild2: $textfeild2, textfeild3: $textfeild3)
                            .hidden()
                    }
                }
                .opacity(ontap ? 1:0)
                .scaleEffect(ontap ? 1:0)
                .offset(x: UIScreen.main.bounds.width * 0.5 - 12, y: -UIScreen.main.bounds.height * 0.41)
                //SearchDetailView
                if issearch{
                    SearchDetailView(issearch: $issearch, placeholdertext: $placeholdertext)
                }
                if shareshow{
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation (.easeIn(duration: 0.25)){
                                shareshow = false
                            }
                        }
                }
                ShareView(shareshow: $shareshow)
                    .offset(y: shareshow ? 0 : 323.7)
                .ignoresSafeArea()
                if moreshow{
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation (.easeIn(duration: 0.25)){
                                moreshow = false
                            }
                        }
                }
                MoreView(moreshow: $moreshow)
                    .offset(y: moreshow ? 0 : 232)
                    .ignoresSafeArea()
            }
            .navigationBarHidden(true)
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(Model())
    }
}
