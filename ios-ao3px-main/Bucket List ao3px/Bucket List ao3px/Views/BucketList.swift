//
//  BucketList.swift
//  Bucket List ao3px
//
//  Created by Alexis Osipovs on 10/25/22.
//
// References:
// Title: Todo List using Core Data SwiftUI Xcode Example Tutorial | Part 1
// URL: https://www.youtube.com/watch?v=OgYluh5sYBA

// Title: Building TodoList App in SwiftUI Using Core Data
// URL: https://youtu.be/CZ79PpB7HIo

import SwiftUI
import CoreData

struct BucketList: View { //Was TaskListView
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder:DateHolder
    
//    @FetchRequest( //gets all items to display
//        sortDescriptors: [NSSortDescriptor(keyPath: \BucketItem.dueDate, ascending: true)],
//        animation: .default)
//
    @FetchRequest( //add additional sorting filter to ensure completed items go to the bottom
            sortDescriptors: [NSSortDescriptor(keyPath: \BucketItem.completedDate, ascending: true),
                              NSSortDescriptor(keyPath: \BucketItem.dueDate, ascending: true)
                             ],
            animation: .default)
    
    private var items: FetchedResults<BucketItem> //store all the items in core data
    
    var body: some View {
        NavigationView {
            
            VStack{
                Divider()
                ZStack{
                    List {
                        
                        ForEach(items) { item in
                            NavigationLink (destination: AddItem(passedTaskItem: item, initialDate: Date()).environmentObject(dateHolder)){
                                DisplayItem(passedTaskItem: item).environmentObject(dateHolder) //navigate to add item and pass data
                            }
                        }.onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                   
                    FloatingButton().environmentObject(dateHolder) // + New Task! button displayed
                    
                } // zstack
            }.navigationTitle("Your Bucket List ✨") //vstack
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            dateHolder.saveContext(viewContext)
        }
    }

    
    struct BucketList_Previews: PreviewProvider { //ContentView
        static var previews: some View {
            BucketList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
