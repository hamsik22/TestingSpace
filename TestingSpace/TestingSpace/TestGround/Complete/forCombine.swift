//
//  forCombine.swift
//  TestingSpace
//
//  Created by 황석현 on 5/2/24.
//

import SwiftUI
import Combine

struct forCombine: View {
    
    @ObservedObject var vm = forCombineViewModel()
    
    var body: some View {
        VStack {
            Text("ViewModel's : \(vm.someValue)")
            Text("Model's : \(vm.model.someValue)")
            Button(action: {
                vm.someValue += 1
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    forCombine()
}

class forCombineViewModel: ObservableObject {
    
    var model: forCombineModel
    @Published var someValue = 100
    
    // MARK: cancellable이란?
    /// Combine 프레임워크에서 생성, 사용되는 Publisher, Subscriber를
    /// 관리하기 위해 하나의 프로퍼티 안에 Cancellable이라는 타입으로 각 객체를 저장한다.
    /// 따라서 메모리 관리 측면에서 Cancellable이 저장된 프로퍼티에 접근하여
    /// 해제 및 관리를 할 수 있다.
    var cancellables = Set<AnyCancellable>()
    
    // MARK: 생성자를 정의한 이유는?
    /// ViewModel 클래스 인스턴스가 생성됨과 동시에
    /// 개발자가 동작하기를 원하는 코드를 작성하기 위함이다.
    /// 따라서, 인스턴스가 생성되고 해당 값을 Model의 프로퍼티에
    /// 값을 전달하기 위한 코드가 아래에 작성되어 있다.
    init() {
        self.model = forCombineModel()
        // MARK: $someValue란?
        /// @Published 프로퍼티 래퍼가 적용된 변수의 프로젝트을 나타낸다.
        /// 그래서 해당 변수의 값이 변경됨을 관찰하고 이벤트를 구독할 수 있다.
        $someValue
        // MARK: sink란?
        /// Subscriber을 생성하며, Publisher로부터 발생하는 값을 받아 처리하는 메서드.
        /// 해당 메서드는 두 가지의 클로져를 인자로 받는데
        /// 한 가지는 완료 이벤트를 처리하고
        /// 다른 한가지는 값을 받아 처리하는 이벤트를 인자로 받는다.
        /// 여기서는 값이 갱신될 때마다 호출되는 클로져만 사용된다.

        // MARK: weak self란?
        /// 인스턴스에 대한 약한 참조를 생성하는 것을 의미한다.
        /// Swift의 메모리 관리 측면에서 강한 순환 참조를 방지하기 위해 약한 참조를 사용하는 것이며,
        /// 강한 순환 참조는 두 객체가 서로 강하게 참조하여 메모리가 해제되지 않는 상황이 발생하므로
        /// weak self를 사용하면 클로져가 self를 강하게 참조하지 않아 self가 필요없어졌을 때 자동으로 메모리 해제한다.
            .sink { [weak self] changes in
                self?.model.someValue = changes
                print("Model updated: \(changes)")
            }
        // MARK: store란?
        /// 생성된 Subscriber를 파라미터로 입력받은 Cancellable 타입 프로퍼티에 저장하는 작업을 수행한다.
        /// 이 작업은 해당 Subscribe가 필요한 동안 지속되도록 보장하고, 뷰모델의 생명주기가 끝날 때, 자동으로
        /// 구독을 취소하여 메모리 누스를 방지한다.
            .store(in: &cancellables)
    }
}

struct forCombineModel {
    var someValue: Int = 0
}
