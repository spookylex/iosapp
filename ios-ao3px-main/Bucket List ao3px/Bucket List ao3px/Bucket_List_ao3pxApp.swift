//
//  Bucket_List_ao3pxApp.swift
//  Bucket List ao3px
//
//  Created by Alexis Osipovs on 10/25/22.

//Reference:
// Title: Todo List using Core Data SwiftUI Xcode Example Tutorial | Part 1
// URL: https://www.youtube.com/watch?v=OgYluh5sYBA

import SwiftUI

@main
struct Bucket_List_ao3pxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            BucketList()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dateHolder)
        }
    }
}
