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
    @EnvironmentObject var tabdatas : Model
    @EnvironmentObject var piccarddatas : Model
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    //搜索栏
                    SearchView(placeholdertext: $placeholdertext)
                    //TabView
                    TabtitleView(isselect: $isselect)
                }
                .background(.white)
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
