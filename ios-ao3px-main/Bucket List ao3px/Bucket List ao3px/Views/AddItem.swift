//
//  AddItem.swift
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

struct AddItem: View { //Was Task Edit View
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder:DateHolder
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var selected: BucketItem? //the current item
    @State var name: String
    @State var desc: String
    @State var dueDate: Date
    @State var scheduleTime: Bool //just a placeholder

    init(passedTaskItem: BucketItem?,  initialDate: Date) //override init function to create initializer
    {
        if let bucketItem = passedTaskItem //meaning we are editing the item
        {
            _selected = State(initialValue: bucketItem)
            _name  = State(initialValue: bucketItem.name ?? "")
            _desc  = State(initialValue: bucketItem.desc ?? "")
            _dueDate  = State(initialValue: bucketItem.dueDate ?? initialDate)
            _scheduleTime  = State(initialValue: bucketItem.scheduleTime)
            
        }
        else { //create new item
            _name  = State(initialValue: "")
            _desc  = State(initialValue: "")
            _dueDate  = State(initialValue: initialDate)
            _scheduleTime  = State(initialValue: false)
        }
            
        
    }
    
    var body: some View {
        Form{
            //display the text edit boxes for user to import data
            Section(header: Text("Add New Bucket List Item"))
            {
                TextField("Bucket Item Name", text: $name)
                TextField("Description", text: $desc)
            }
            Section(header: Text("Due Date"))
            {
                DatePicker("Due Date", selection: $dueDate, displayedComponents: scheduleTime ? [.hourAndMinute, .date] : [.date]) //do not display time
            }
            
            
            if selected?.isCompleted() ?? false { //only displays this section when checkmark is clicked
                Section()
                {
                    Text("Completed").foregroundColor(.green) //will display in the edit screen that a task has been completed
                }
            }
            
            
            Section()
            {
                Button("Save", action: saveAction) //save to core data
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    func saveAction(){ //setting data
         
        withAnimation{
            
            if selected == nil { //create a new bucket item
                selected = BucketItem(context:  viewContext) //creating a new core data item
            }
            selected?.created = Date()
            selected?.name = name
            selected?.desc = desc
            selected?.dueDate = dueDate
            dateHolder.saveContext(viewContext)
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem(passedTaskItem: BucketItem(), initialDate: Date())
    }
}
 
