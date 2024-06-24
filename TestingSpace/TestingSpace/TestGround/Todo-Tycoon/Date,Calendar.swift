//
//  Date,Calendar.swift
//  TestingSpace
//
//  Created by 황석현 on 6/10/24.
//

import SwiftUI

// Date와 Calendar를 통해서 요소를 꺼낼 수 있는지 확인하기.
struct Date_Calendar: View {

    @ObservedObject var viewModel = Date_CalendarModel()
    
    var body: some View {
        VStack{
            Text("이번 달은 ?")
            Text("\(viewModel.month ?? 00 )")
            Text("오늘은 몇일 ?")
            Text("\(viewModel.date ?? 00)")
            Text("오늘은 무슨 요일 ?")
            Text("\(viewModel.day ?? 00)")
            Text("지금은 몇 초 ?")
            Text("\(viewModel.second ?? 00)")
            Button(action: {viewModel.getData()}, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

// Date, Calendar를 활용하여 ScrollView를 만들 수 있는지 확인하기.
struct Date_CalendarListView: View {

    @ObservedObject var viewModel = Date_CalendarModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            
            HStack{
                Button(action: {viewModel.getDayRange()}, label: {
                    Text("getDayRange")
                })
                Button(action: {viewModel.getWeekDay()}, label: {
                    Text("getWeekDay")
                })
                ForEach(viewModel.dayRange, id: \.self) { item in
                    Text("\(item)")
                }
                ForEach(viewModel.weekdayRange, id: \.self) { item in
                    Text("\(item)")
                }
            }
            
        }
    }
}

struct SomeView1: View {
    
    @State private var selectedDay: Int? = nil
    @State private var scrollViewHeight: CGFloat = 0.0
    
    @State var selection = 0
    let days = Array(1...30)
    let weekdays = ["월", "화", "수", "목", "금", "토", "일"]

    var body: some View {
        
        VStack {
            Text("2024년 6월 1일 ~ 30일")
                .font(.title)
                .padding()
            ScrollViewReader { proxy in
                ScrollView(.vertical) {
                    VStack {
                        ForEach(days, id: \.self) { day in
                            HStack {
                                Text("6월 \(day)일")
                                Spacer()
                                Text("\(weekdays[(day-1)%7])요일")
                            }
                            .id(day)
                            .onTapGesture {
                                selectedDay = day
                                proxy.scrollTo(day, anchor: .center)
                            }
                        }
                    }
                }
            }
            if let selectedDay = selectedDay {
                Text("선택한 날짜: 6월 \(selectedDay)일, \(weekdays[(selectedDay - 1) % 7])요일")
                    .padding()
            } else {
                Text("날짜를 선택해주세요")
                    .padding()
            }
        }
        .padding()
    }
}
#Preview("someView 1", body: {
    SomeView1()
})

// 옆으로 넘기는 화면은 어떻게 구현할건가?

#Preview("preview 1") {
    Date_Calendar()
}
#Preview("preview 2") {
    Date_CalendarListView()
}

class Date_CalendarModel: ObservableObject {
    
    @Published var mainDate = Date()
    var cal: Calendar = Calendar.current
    var year: Int?
    var month: Int?
    var date: Int?
    var day: Int?
    var second: Int?
    @Published var dayRange: Range<Int> = 0..<1
    @Published var weekdayRange: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.mainDate = Date.now
        self.cal = Calendar.current
        
        let components = self.cal.dateComponents([.year, .month, .day, .weekday, .second], from: self.mainDate)
        if let year = components.year { self.year = year }
        if let month = components.month { self.month = month }
        if let date = components.day { self.date = date }
        if let day = components.weekday { self.day = day }
        if let second = components.second { self.second = second }
    }
    
    func getDayRange(){
        let calendar = Calendar.current
        guard let range = calendar.range(of: .day, in: .month, for: self.mainDate) else { return }
        self.dayRange = range
    }
    func getWeekDay() {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "Ko_KR")
        dateFormatter.dateFormat = "E"
        
        var days: [Int] = []
        var weekdays: [String] = []
        
        for day in 1...(self.day ?? 31) {
            if let date = calendar.date(from: DateComponents(year: self.year, month: self.month, day: day)) {
                days.append(day)
                let weekday = dateFormatter.string(from: date)
                weekdays.append(weekday)
            }
        }
        
        self.weekdayRange = weekdays
    }
}
