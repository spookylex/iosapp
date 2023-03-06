//
//  FloatingButton.swift
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

struct FloatingButton: View {
    
    @EnvironmentObject var dateHolder:DateHolder

    
    var body: some View {
       
        VStack
        {
            Spacer()
            HStack
            {
                Spacer()
                NavigationLink(destination: AddItem(passedTaskItem: nil, initialDate: Date()).environmentObject(dateHolder))
                {
                    Text("+ New Item!")
                        .font(.headline)
                }
                .padding(15)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(30)
                .padding(30)
                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y:3)
                
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
