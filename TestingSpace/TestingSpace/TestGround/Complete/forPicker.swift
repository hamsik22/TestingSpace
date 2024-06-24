//
//  forPicker.swift
//  TestingSpace
//
//  Created by 황석현 on 3/5/24.
//

import SwiftUI

struct forPicker: View {
    
    var range1 = Array(stride(from: 1, to: 6, by: 1))
    var range2 = Array(stride(from: 6, to: 11, by: 1))
    var range3 = Array(stride(from: 11, to: 16, by: 1))
    @State var selection1 = 0
    @State var selection2 = 0
    @State var selection3 = 0
    
    var body: some View {
        HStack {
            Picker("titleKey", selection: $selection1) {
                ForEach(range1, id:\.self) { item in
                    Text("\(item)")
                        .tag(item)
                }
            }.pickerStyle(.wheel)
            Picker("titleKey", selection: $selection1) {
                ForEach(range1, id:\.self) { item in
                    Text("\(item)")
                        .tag(item)
                }
            }.pickerStyle(.wheel)
            Picker("titleKey", selection: $selection1) {
                ForEach(range1, id:\.self) { item in
                    Text("\(item)")
                        .tag(item)
                }
            }.pickerStyle(.wheel)
        }
    }
}

#Preview {
    forPicker()
}
