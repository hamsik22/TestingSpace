//
//  ForAlert.swift
//  TestingSpace
//
//  Created by 황석현 on 6/22/24.
//
/// 1.기본 팝업을 띄워본다.
/// 2. 팝업의 화면을 바꿔본다.
/// 3. .onLongPressGesture을 사용해서 알람을 띄워본다.

import SwiftUI

struct ForAlert: View {
    
    @State private var isPopup: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                isPopup.toggle()
            }, label: {
                Text("Button")
            })
            .alert(isPresented: $isPopup) {
                Alert(title: Text("Title"), message: Text("Message"),
                      dismissButton: .default(Text("Default")))
            }
            
            
        }
    }
}

#Preview {
    ForAlert()
}
