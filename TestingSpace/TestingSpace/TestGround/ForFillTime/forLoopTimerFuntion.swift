//
//  forLoopTimerFuntion.swift
//  TestingSpace
//
//  Created by 황석현 on 5/1/24.
//

import SwiftUI

struct forLoopTimerFuntion: View {
    
    @ObservedObject var vm = forLoopTimerFuntionVM()
    
    var body: some View {
        Text("Time : \(vm.timeLeft)")
            .font(.largeTitle)
        Text("Cycle : \(vm.cycle)")
            .font(.largeTitle)
        HStack {
            Button(action: {vm.startTimer()}, label: {
                Text("Start")
                    .font(.title)
                    .background(.green)
            })
            Button(action: {vm.stopTimer()}, label: {
                Text("Stop")
                    .font(.title)
                    .background(.yellow)
            })
        }
    }
}

#Preview {
    forLoopTimerFuntion()
}

class forLoopTimerFuntionVM: ObservableObject {
    
    @Published var timeLeft = 5
    @Published var cycle = 2
    var timer: Timer?
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.timeLeft -= 1
            if self.timeLeft == 0 {
                if self.cycle == 0 {
                    timer.invalidate()
                    print("Timer has End!")
                    return
                }
                self.cycle -= 1
                self.timeLeft = 5
                print("Timer has Reset!")
            }
        })
    }
    func stopTimer() {
        self.timer?.invalidate()
        print("Timer has Stopped!")
    }
}

class forLoopTimerFuntionModel {
    
    var timeLeft: Int = 5
    var cycle: Int = 2
    
}

