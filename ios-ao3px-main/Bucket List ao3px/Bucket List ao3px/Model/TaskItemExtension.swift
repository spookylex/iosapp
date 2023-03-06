//
//  TaskItemExtension.swift
//  Bucket List ao3px
//
//  Created by Alexis Osipovs on 10/30/22.
//
// Reference:
// Title: Todo List using Core Data SwiftUI Xcode Example Tutorial | Part 1
// URL: https://www.youtube.com/watch?v=OgYluh5sYBA

import SwiftUI


extension BucketItem
{
    
    func isCompleted() -> Bool
    {
        return completedDate != nil //meaning it is completed
    }
    
    func dueDateTimeOnly() -> String
    {
        if let due = dueDate
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter.string(from: due)
        }
        
        return ""
    }
}
