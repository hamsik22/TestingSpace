//
//  ForEditMode.swift
//  TestingSpace
//
//  Created by 황석현 on 6/22/24.
//


import SwiftUI

/**공식문서의 예시코드*/
struct ForEditMode: View {
    
    @Environment(\.editMode) private var editMode
    @State private var name = "Maria Ruiz"
    
    var body: some View {
        Form {
            if editMode?.wrappedValue.isEditing == true {
                TextField("Name", text: $name)
            } else {
                Text(name)
            }
        }
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar { // Assumes embedding this view in a NavigationView.
            EditButton()
        }
    }
}
/**네비게이션을 통한 에디트모드*/
struct HomeViewForEditMode: View {
    var body: some View {
        VStack {
            Text("I'm Home View")
            NavigationStack {
                NavigationLink("NavigationLink") {
                    ForEditMode()
                }
                Button {
                } label: {
                    Text("Button")
                }
            }
        }
    }
}

struct ListViewForEditMode: View {
    @State private var items = Array(1...5)
    @State private var editMode = EditMode.inactive

    var body: some View {
        VStack {
            HStack {
                Spacer()
                EditButton()
                    .padding()
            }
            
            List {
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                }
                .onDelete { indices in
                    items.remove(atOffsets: indices)
                }
            }
            .environment(\.editMode, $editMode)
        }
        .padding()
    }
}

struct MoveOffsetForEditMode: View {
    @State private var items = Array(1...5)
    @State private var editMode = EditMode.inactive

    var body: some View {
        VStack {
            HStack {
                Spacer()
                EditButton()
                    .padding()
            }
            
            List {
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                }
                .onDelete { indices in
                    items.remove(atOffsets: indices)
                }
                .onMove { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .environment(\.editMode, $editMode)
        }
        .padding()
    }
}


#Preview("HomeViewForEditMode") {
    HomeViewForEditMode()
}
#Preview("ForEditMode") {
    ForEditMode()
}
#Preview("ListViewForEditMode") {
    ListViewForEditMode()
}
#Preview("MoveOffsetForEditMode") {
    MoveOffsetForEditMode()
}
