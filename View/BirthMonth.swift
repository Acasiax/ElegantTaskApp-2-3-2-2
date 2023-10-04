//
//  BirthMonth.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/18.
//

//import SwiftUI

import SwiftUI
import Combine

// 데쉬보드 그리드 모델 데이터들
// 데쉬보드 테스트 내용
struct Fitness: Identifiable {
    var id: String // Task 모델의 id를 사용
    var title: String
    var image: String
    var color: Color
    var data: String
    var suggerst: String
}

class oppa: ObservableObject {
    @Published var title: String = ""
    @Published var suggerst: Date = Date()
    @Published var fit_Date: [Fitness] = []
    
    private var cancellable: AnyCancellable? = nil // AnyCancellable 객체를 저장할 프로퍼티
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd" // 현재 날짜를 "MM dd" 형식으로 지정
        let suggerstDateFormatter = DateFormatter()
        suggerstDateFormatter.dateFormat = "M월 d일" // "월 일" 형식으로 지정
        
        
        
        cancellable = TaskStore.shared.$newtasks.sink { [weak self] tasks in
            guard let self = self else { return }

            let fetchedTasks = PersistenceController.shared.fetchTasks()

            self.fit_Date = fetchedTasks.flatMap { taskMetaData -> [Fitness] in
                if taskMetaData.isOn3 {
                    return taskMetaData.task.compactMap { task -> Fitness? in
                        let currentDate = Calendar.current.startOfDay(for: Date())
                        let taskDate = Calendar.current.startOfDay(for: taskMetaData.taskDate)

                        let daysBetween = Calendar.current.dateComponents([.day], from: currentDate, to: taskDate).day ?? 0
                        print("✅저장된 일정날짜는 - \(taskMetaData.taskDate)")
                        print("✅날짜가 얼마 남았냐면 - \(daysBetween)")

                        let daysString = daysBetween == 0 ? "오늘 생일!" : "D-\(daysBetween)일 남음"

                        let suggerstDate = Calendar.current.date(byAdding: .day, value: 0, to: taskMetaData.taskDate)!
                        let suggerstString = suggerstDateFormatter.string(from: suggerstDate)
                               
                               
                               
                               print("Fitness 정보입니다다다다: \(Fitness(id: "\(taskMetaData.id) - \(task.id)", title: task.title, image: "잔다", color: .pink, data: daysString, suggerst: suggerstString)))")
                                                      
                               return Fitness(id: "\(taskMetaData.id) - \(task.id)", title: task.title, image: "잔다", color: .pink, data: daysString, suggerst: suggerstString)
                           }
                       } else {
                           return []
                       }
                   }
            
          //  print("HBD배열에 추가했습니다-: \(fetchedTasks)")
        }
        
    }
}
