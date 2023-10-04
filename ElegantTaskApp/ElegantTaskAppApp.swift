//
//  ElegantTaskAppApp.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/14.
//

import SwiftUI

@main
struct ElegantTaskAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           
            MainContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    ssaveNewTasksToCoreData()
                }
        }
    }

    private func ssaveNewTasksToCoreData() {
        let existingTasks = persistenceController.fetchTasks()

        // 이전에 저장된 작업을 모두 삭제
      
        persistenceController.deleteAllTasks()

        // 기존 작업을 저장
        persistenceController.saveNewTasks(existingTasks)
        
        
        
    }
}
