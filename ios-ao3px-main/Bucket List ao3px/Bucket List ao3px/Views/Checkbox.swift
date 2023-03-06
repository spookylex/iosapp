//
//  Checkbox.swift
//  Bucket List ao3px
//
//  Created by Alexis Osipovs on 10/30/22.
//
// References:
// Title: Todo List using Core Data SwiftUI Xcode Example Tutorial | Part 1
// URL: https://www.youtube.com/watch?v=OgYluh5sYBA

// Title: Building TodoList App in SwiftUI Using Core Data
// URL: https://youtu.be/CZ79PpB7HIo


import SwiftUI

struct Checkbox: View {
    @EnvironmentObject var dateHolder:DateHolder
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var passedTaskItem: BucketItem
    
    var body: some View
      {
          Image(systemName: passedTaskItem.isCompleted() ? "checkmark.circle.fill" : "circle")
              .foregroundColor(passedTaskItem.isCompleted() ? .green : .secondary)
              .onTapGesture {
                  withAnimation
                  {
                      if !passedTaskItem.isCompleted(){
                          passedTaskItem.completedDate = Date()
                          dateHolder.saveContext(viewContext)
                      }
                      
                  }
              }
      }
  }

  struct Checkbox_Previews: PreviewProvider {
      static var previews: some View {
          Checkbox(passedTaskItem: BucketItem())
      }
  }
