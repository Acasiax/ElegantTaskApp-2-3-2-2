//
//  HBDView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/17.
//


import SwiftUI

struct HBDView: View {
    //버튼을 눌렀을때 월이 변해야함
    @State var currentDate: Date = Date()
   @State var currentDay: Date = Date()
    @State var currentMonth: Int = 0
    @Binding var hbdView : Date
    @State private var selectedMonthIndex: Int = 0
    
//    var currentDay: Date = Date() // currentDate 프로퍼티 추가
    
    
    var body: some View {
           ZStack{
               LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.7), .pink.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                   .opacity(0.9)
                   .ignoresSafeArea()
               VStack{
                   Enjoy()
                   ScrollView(.vertical, showsIndicators: false){
                       LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
                           Section{
//                               ScrollView(.horizontal, showsIndicators: false){
//                                   HStack(spacing: 10) {
//                                       ForEach(currentDate.getNextSixMonths().indices, id: \.self) { index in
//                                           VStack{
//                                               Circle()
//                                                   .fill(selectedMonthIndex == index && Date().isCurrentMonth(currentDate.getNextSixMonths()[index]) ? .white : .clear)
//                                                   .frame(width: 8, height: 8)
//
//                                               Text(currentDate.getNextSixMonths()[index])
//                                                   .font(.system(size: 20))
//                                                   .fontWeight(.semibold)
//                                           }
//                                           .foregroundColor(.white)
//                                           .frame(width: 50, height: 60)
//                                           .background(
//                                               ZStack{
//                                                   Capsule()
//                                                       .fill(.yellow.gradient.opacity(0.4))
//                                               }
//                                               .onTapGesture {
//                                                   selectedMonthIndex = index
//                                               }
//                                           )
//                                       }
//                                   }
//                                   .padding(20)
//                               }
                               Homee()
                           }
                       }
                       .background(Color.clear)
                   }
               }
           }
       }
   }

    
    //사진이랑 로고
    func HbdLOGOView()->some View{
        
        VStack(spacing: 20) {
            Text("HBD!!")
                .ubuntu(60, .bold)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.pink.opacity(0.9))
            
//            Image("HBD")
//            //  .resizable()
//                .scaledToFit()
            
//            Image("cake01")
//            //  .resizable()
//                .scaledToFit()
    
        } //.vAlign(.top) //위로 정렬(HBD타이틀이랑, 사진)
    }


//ui디자인은 도와주는 기능들을 확장구현했습니다.

extension View{
    
    func hLeading()->some View{
        self
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    func hTrailng()->some View{
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
        
    }
    
    func hCenter()->some View{
        self
            .frame(maxWidth: .infinity, alignment: .center)
        
    }
    
}


extension Date {
    
    var monthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
    func isCurrentMonth(_ monthString: String) -> Bool {
           let formatter = DateFormatter()
           formatter.dateFormat = "MMMM"
           let currentMonthString = formatter.string(from: self)
           return monthString == currentMonthString
       }
    func getNextSixMonths() -> [String] {
        var months = [String]()
        for i in 0..<12 {
            if let date = Calendar.current.date(byAdding: .month, value: i, to: self) {
                let monthString = date.monthFormatter.string(from: date)
                months.append(monthString)
                
            }
        }
        return months
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        let isSameDay = calendar.isDate(date, equalTo: Date(), toGranularity: .day)
        return isSameDay
    }
    
}


extension View {
    func headerView()-> some View {
        self.modifier(HeaderViewModifier())
    }
}

struct HeaderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                VStack(spacing: 0) {
                    Color.white
                        .frame(height: {
                            guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
                                return 0
                            }
                            return windowScene.statusBarManager?.statusBarFrame.height ?? 0
                        }())
                        .ignoresSafeArea(.all, edges: .top)
                    content
                }
            )
    }
}


struct HBDView_Previews: PreviewProvider {
    static var previews: some View {
       // cardView()
        HBDView(hbdView: .constant(Date()))
    }
}





//🏁월 목록
//🏁
struct Homee: View {
    @State var currentDate: Date = Date()
    @State var currentDay: Date = Date()
    @State var currentMonth: Int = 0
    @State var index = 0
    @State private var selectedMonthIndex: Int = 0
    @ObservedObject var myOppa = oppa()
  //  @ObservedObject var filteredData: [Fitness] = []
    var colums = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
    
    var body: some View {
        HStack(spacing: 10) {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(currentDate.getNextSixMonths().indices, id: \.self) { index in
                            VStack {
                                Circle()
                                
                                    .fill(selectedMonthIndex == index ? .white : .clear)
                                // .fill(selectedMonthIndex == index && Date().isCurrentMonth(currentDate.getNextSixMonths()[index]) ? .white : .clear)
                                    .frame(width: 8, height: 8)
                                
                                Text(currentDate.getNextSixMonths()[index])
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(width: 50, height: 60)
                            .background(
                                ZStack {
                                    Capsule()
                                        .fill(.pink.gradient.opacity(0.3))
                                }
                                    .onTapGesture {
                                        selectedMonthIndex = index
                                    }
                            )
                        }
                    }
                    .padding(20)
                }
               
                let myOppa = oppa()
                let filteredData = myOppa.fit_Date.filter { fitness in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "M월"
                    let currentMonthString = dateFormatter.string(from: currentDate)
                    if let month = Int(fitness.suggerst.split(separator: " ")[0].replacingOccurrences(of: "월", with: "")), month == selectedMonthIndex + Int(currentMonthString.replacingOccurrences(of: "월", with: ""))! {
                        return true
                    } else {
                        return false
                    }
                }

                
                if filteredData.count > 0{
                    
                    LazyVGrid(columns: colums, spacing: 5) {
                        ForEach(filteredData) { fitness in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(fitness.title)
                                    .foregroundColor(.white)
                                
                                Text(fitness.data)
                                    .font(.system(size: 20))
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top, 10)
                                
                                HStack {
                                    Spacer(minLength: 0)
                                    Text(fitness.suggerst)
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                }
                            }
                            .padding()
                            .background(Color.orange.gradient.opacity(0.7))
                            .cornerRadius(10)
                            .padding(15)
                        }
                    }
                }
            }
        }
        
    }
}
