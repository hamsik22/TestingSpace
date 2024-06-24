//
//  ForMenu.swift
//  TestingSpace
//
//  Created by 황석현 on 6/22/24.
//

import SwiftUI

struct ContextMenuViewforTodoTycoon: View {
    
    @State var someInt = 0
    @State var contextInt = 0
    
    var body: some View {
        VStack {
            Button(action: {
                someInt+=1
            }, label: {
                Text("Button")
                    .contextMenu {
                        Button(role: .destructive) {
                            contextInt+=1
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }

                    }
            })
            Text("someInt:\(someInt)")
            Text("ContextMenu: \(contextInt)")
        }
    }
}
#Preview("ContextMenuViewforTodoTycoon") {
    ContextMenuViewforTodoTycoon()
}

struct ContextMenuForMenu: View {
    
    @State var isPressingChanged = false
    
    var body: some View {
        VStack {
            Image(systemName: "sum")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .contextMenu {
                    Button {
                        print("action for context menu item 1")
                    } label: {
                        Label("First", systemImage: "icon_name")
                    }
                    // Additional context menu items
                }
        }
    }
}

#Preview {
    ContextMenuForMenu()
}
