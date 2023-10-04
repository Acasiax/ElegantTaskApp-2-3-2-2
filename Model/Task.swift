//
//  Task.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/14.
//

import SwiftUI
import CoreData

// 일정 추가 배열
struct Task: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
    var isOn3: Bool // <- 새로 추가된 속성
}

// 총합 TaskMetaData
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
    var isOn3: Bool // <- 새로 추가된 속성
}






// TaskStore 클래스
class TaskStore: ObservableObject {
    static var shared = TaskStore()
    
    // Core Data context
    private let context = PersistenceController.shared.container.viewContext
    
    // TaskMetaData 배열
    @Published var newtasks: [TaskMetaData] = []
    
    var isOn3: Bool = true // <- isOn3 멤버 변수 추가
    
    
    
    
    
    
    
    func saveNewTasksToCoreData() {
        PersistenceController.shared.saveNewTasks(newtasks)

    }
    
    // 현재 시간을 가져오는 메서드
    private var currentDate: Date {
        return Date()
    }
    
    func deleteTASK(_ taskMetaData: TaskMetaData) {
        DispatchQueue.main.async {
            PersistenceController.shared.delete(taskMetaData)
            if let index = self.newtasks.firstIndex(where: { $0.id == taskMetaData.id }) {
                print("deleteTASK 메소드의 일정이 삭제되었습니다.")
                self.newtasks.remove(at: index)
            } else {
               // print("deleteTASK 메소드: 해당 일정을 찾을 수 없습니다.")
                self.newtasks = self.newtasks.filter { $0.id != taskMetaData.id }
            }
        }
    }

    
    
    
//    func deleteTASK(_ taskMetaData: TaskMetaData) {
//        DispatchQueue.main.async {
//            PersistenceController.shared.delete(taskMetaData)
//            if let index = self.newtasks.firstIndex(where: { $0.id == taskMetaData.id }) {
//                print("deleteTASK메소드의 일정이 삭제되었습니다.")
//                self.newtasks.remove(at: index)
//
//            }
//        }
//    }
    
}
