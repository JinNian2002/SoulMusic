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

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var placeholdertext = ""
    @State var isselect = 0
    @State var ontap = false
    @EnvironmentObject var tabdatas : Model
    @EnvironmentObject var piccarddatas : Model
    var body: some View {
        NavigationView{
            ZStack{
                VStack(spacing: 0){
                    VStack{
                        //搜索栏
                        SearchView(placeholdertext: $placeholdertext, ontap: $ontap)
                        //TabView
                        TabtitleView(isselect: $isselect)
                    }
                    .background(Color("Surface"))
                    .shadow(color: .black.opacity(0.05), radius: 46, y: -4)
                    
                    TabView(selection: $isselect){
                        //Recommend
                        RecommendView(piccarddatas: _piccarddatas)
                            .tag(0)
                        //Focus
                        FocusView(piccarddatas: _piccarddatas)
                            .tag(1)
                        //Travel
                        TravelView(piccarddatas: _piccarddatas)
                        .tag(2)
                        //Comic
                        TravelView(piccarddatas: _piccarddatas)
                        .tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    //Tabbar
                    TabbarView()
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
                        MenuView(ontap: $ontap)
                        MenuView(ontap: $ontap)
                    }
                    .hidden()
                    HStack{
                        MenuView(ontap: $ontap)
                        MenuView(ontap: $ontap)
                            .hidden()
                    }
                }
                .opacity(ontap ? 1:0)
                .scaleEffect(ontap ? 1:0)
                .offset(x: UIScreen.main.bounds.width * 0.5 - 12, y: -UIScreen.main.bounds.height * 0.41)
                
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
