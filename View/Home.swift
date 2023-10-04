//
//  Home.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/14.
//

//import SwiftUI
//🎯
import SwiftUI

struct Home: View {
    @State var vipCardView: Date = Date()
    //@State var VipCardView = false
    @State var currentDate: Date = Date()
    @State private var selectedTab = 1 // Set the second tab as the initial selected tab
    @State var chatView: Date = Date()
@State var schoolScheduleView : Date = Date()
   @State var hbdView: Date = Date()
    @State var birthMonth: Date = Date()
 //   @Binding var taskDate: Date
    @State var taskDate: Date = Date() // 바인딩할 @State 변수 추가
   // @State var selectedDate: Date
    @State var selectedDate: Date = Date()
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            //  HBDView(hbdView: $hbdView)
            HBDView(hbdView: $hbdView)
                .tabItem {
                    Label("HBD", systemImage: "heart")
                }
                .tag(0)
            
           // CustomDatePicker(taskDate: $taskDate, currentDate: $currentDate)
            CustomDatePicker(taskDate: $taskDate, currentDate: $currentDate, selectedDate: $selectedDate)

                .tabItem {
                    Label("캘린더", systemImage: "calendar")
                }
                .tag(1)
            
//            SchoolScheduleView(schoolScheduleView: $schoolScheduleView)
//                .tabItem {
//                    Label("시간표", systemImage: "deskclock")
//                }
//                .tag(2)

                .tabItem {
                    Label("설정", systemImage: "gear")
                }
                .tag(3)
            
            ChatView(chatView: $chatView)
           // Text("설정 화면")
                 .tabItem {
                     Label("선물", systemImage: "bubble.left.and.bubble.right.fill")
                     //"bubble.left.and.bubble.right.fill"
                     //message.badge.circle.fill
                 }
                 .tag(4)
            
            
            VipCardView(vipCardView: $vipCardView)
           // Text("설정 화면")
                 .tabItem {
                     Label("클럽티켓", systemImage: "ticket.fill")
                 }
                 .tag(5)
        }
        .accentColor(.pink)
       
        .tabViewStyle(DefaultTabViewStyle()) // Add the tab view style modifier
        .onAppear {
          //  UITabBar.appearance().barTintColor = .white
            UITabBar.appearance().backgroundColor = .white
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
