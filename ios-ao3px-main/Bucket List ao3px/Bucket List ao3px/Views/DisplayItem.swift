//
//  DisplayItem.swift
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

struct DisplayItem: View {
    @EnvironmentObject var dateHolder:DateHolder

    @ObservedObject var passedTaskItem: BucketItem
    
    var body: some View {
        
        Checkbox(passedTaskItem: passedTaskItem).environmentObject(dateHolder)

        Text(passedTaskItem.name ?? "") //prints name if null prints nothing
            .padding(.horizontal)
        
        //Print the due date next to the item
        Text(passedTaskItem.dueDate?.formatted(date: .abbreviated, time: .omitted) ?? "").padding(.horizontal).foregroundColor(.gray)

    }
}

struct DisplayItem_Previews: PreviewProvider {
    static var previews: some View {
        DisplayItem(passedTaskItem: BucketItem())
    }
}
