//
//  TaskCell.swift
//  TestingSpace
//
//  Created by 황석현 on 6/20/24.
//

import SwiftUI

struct TaskListView: View {
    
    // TODO: 데이터 구조 설계하기
    var TaskArray: [MockTaskData] = [
        MockTaskData(taskTitle: "기초디자인 포스터 1", taskDuration: 20, taskHasDone: false),
        MockTaskData(taskTitle: "기초디자인 포스터 2", taskDuration: 40, taskHasDone: true),
        MockTaskData(taskTitle: "할일 할일 할일 1", taskDuration: 20, taskHasDone: false),
        MockTaskData(taskTitle: "할일 할일 할일 2", taskDuration: 30, taskHasDone: true)]
    @State var isPresented = false
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("\(TaskArray.count)개의 할 일")
                    
                    Spacer()
                    
                    // TODO: 정렬 기능 구현하기
                    Text("정렬")
                    Image(systemName: "arrow.up.arrow.down")
                }
                .padding()
                
                ForEach(TaskArray) { dummy in
                    TaskListCell(taskTitle: dummy.taskTitle, taskDuration: dummy.taskDuration, taskHasDone: dummy.taskHasDone)
                }
                .onTapGesture {
                    isPresented.toggle()
                }
                
                Section {
                    ForEach(TaskArray) { dummy in
                        TaskListCell(taskTitle: dummy.taskTitle, taskDuration: dummy.taskDuration, taskHasDone: dummy.taskHasDone)
                    }
                } header: {
                    HStack {
                        Text("완료")
                            .padding()
                        Spacer()
                    }
                } footer: {
                    
                }

                
                Spacer()
            }
        }
    }
}

#Preview("TaskListView"){
    TaskListView()
}

struct TaskListCell: View {
    
    var taskTitle: String
    var taskDuration: Int
    @State var taskHasDone: Bool
    
    var body: some View {
            HStack {
                if taskHasDone {
                    Image(systemName: "checkmark.square")
                }else {
                    Image(systemName: "square")
                }
                
                Text(taskTitle)
                    .font(.system(size: 14))
                    .padding(.horizontal, 10)
                
                Spacer()
                
                Button(action: {}, label: {
                    Label("\(taskDuration)분", systemImage: "clock")
                        .font(.system(size: 10))
                        .foregroundStyle(.black)
                })
                .frame(width: 50, height: 18)
                .background(.gray).opacity(0.3)
                .clipShape(.rect(cornerRadius: 4))
                
            }
        .frame(width: .infinity, height: 27)
        .padding(20)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .padding(.horizontal, 10)
    }
}

#Preview("TaskCell") {
    TaskListCell(taskTitle: "기초 디자인 포스터", taskDuration: 20, taskHasDone: false)
}

struct MockTaskData: Identifiable {
    let id = UUID()
    var taskTitle: String
    var taskDuration: Int
    var taskHasDone: Bool
}
