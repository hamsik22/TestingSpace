//
//  forBinding.swift
//  TestingSpace
//
//  Created by 황석현 on 5/2/24.
//
// MARK: 바인딩을 하려면 꼭 프로퍼티 래퍼를 사용해야하는가?
/// 결과 : 값의 변경은 퍼블리쉬를 한 것과 안한 것 둘 다 변경된다.
/// 그러나 뷰에 반영되는 것은 퍼블리쉬를 한 값만 반영된다.
/// 그렇다면 Published만 뷰에 반영되는걸까?
/// 값이 변경되고 뷰에 반영되는 것을 정리하자면...
/// - Published = 값, 뷰
/// - UnPublished = 값
/// - State = X
/// 따라서, MVVM 패턴의 뷰와 뷰모델에서는 Published와 UnPublished로 나뉘어서 사용가능함.
import SwiftUI

struct forBinding: View {
    
    @ObservedObject var vm = forBindingClass()
    
    var body: some View {
        VStack {
            Text("Published : \(vm.published)")
            Text("UnPublished : \(vm.unPublished)")
            Text("stated : \(vm.stated)")
            
            Button(action: {
                vm.published += 1
                print(vm.published)
            }, label: {
                Text("for Published")
            })
            Button(action: {
                vm.unPublished += 1
                print(vm.unPublished)
            }, label: {
                Text("for UnPublished")
            })
            Button(action: {
                vm.stated += 1
                print(vm.stated)
            }, label: {
                Text("for Stated")
            })
        }
    }
}

class forBindingClass: ObservableObject {
    @Published var published = 1
    var unPublished = 1
    @State var stated = 1
}

#Preview {
    forBinding()
}
