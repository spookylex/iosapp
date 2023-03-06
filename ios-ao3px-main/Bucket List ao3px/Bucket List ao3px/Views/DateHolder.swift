//
//  DateHolder.swift
//  Bucket List ao3px
//
//  Created by Alexis Osipovs on 10/26/22.
//
// References:
// Title: Todo List using Core Data SwiftUI Xcode Example Tutorial | Part 1
// URL: https://www.youtube.com/watch?v=OgYluh5sYBA

// Title: Building TodoList App in SwiftUI Using Core Data
// URL: https://youtu.be/CZ79PpB7HIo

import SwiftUI
import CoreData

class DateHolder: ObservableObject {
    
    init (_ context: NSManagedObjectContext ){
        
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
       do {
           try context.save()
       }catch {
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
       }
   }
    
}
