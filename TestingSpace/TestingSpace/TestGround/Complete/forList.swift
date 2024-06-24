//
//  forList.swift
//  TestingSpace
//
//  Created by 황석현 on 3/2/24.
//
import SwiftUI


struct forListID: Identifiable {
    var id = UUID()
    var name: String
}

struct fruitListView: View {
    var fruit: forListID
    var body: some View {
        Text(fruit.name)
    }
}

struct forList: View {
    
    var fruitArray = ["Apple", "Banana", "Coconut"]
    var forListArray = [forListID(name: "Tomato"),
                        forListID(name: "Strawberry"),
                        forListID(name: "Orange")]
    
    var body: some View {
        VStack {
            /**배열과 같은 컬렉션을 List를 통해 표시할 때, 반복문을 활용하면
             보다 간편하게 코딩이 가능하다. 하지만 Identifiable 프로토콜을 채택하지 않으면
             Foreach 혹은 List를 사용할 수 없게 된다.*/
            List {
                Text("Hello, World!")
                Text("Hello, World!")
                Text(fruitArray[0])
                Text(fruitArray[1])
                Text(fruitArray[2])
            }
            
            // Identifiable 채택 후
            List(forListArray) { item in
                fruitListView(fruit: item)
            }   
            
            // Identifiable 채택 후
            List(forListArray) { item in
                Text(item.name)
            }
            
            ForEach(forListArray) { item in
                Text(item.name)
            }
        }
    }
}

/**
 Identifiable 프로토콜을 채택하지 않은 채 List를 사용하면 오류가 발생함.
 Initializer 'init(_:rowContent:)' requires that 'String' conform to 'Identifiable'
 ---
 List(fruitArray) { item in
 Text(item)
 }
 */
#Preview {
    forList()
}
