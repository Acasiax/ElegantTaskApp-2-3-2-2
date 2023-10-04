//
//  wheel.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/05/21.
//

//import SwiftUI
//
//struct wheel: View {
//    @State private var lunarselectedYear = Calendar.current.component(.year, from: Date()) - 1940
//    @State private var lunarselectedMonth = Calendar.current.component(.month, from: Date()) - 1
//    @State private var lunarselectedDay = Calendar.current.component(.day, from: Date()) - 1
//    @State private var lunarsavedDates: [String] = []
//    
//    let years = Array(1940...Calendar.current.component(.year, from: Date()))
//    let months = Array(1...12)
//    let days = Array(1...31)
//    
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }
//    
//    var body: some View {
//        VStack {
//            HStack {
//                lunarYearPicker
//                    .frame(height: 150)
//                
//                monthPicker
//                    .frame(height: 150)
//                
//                dayPicker
//                    .frame(height: 150)
//            }
//            
//            Text("Selected Date: \(years[lunarselectedYear])-\(months[lunarselectedMonth])-\(days[lunarselectedDay])")
//            
//            Button(action: {
//                let lunarDate = Calendar(identifier: .chinese).date(from: DateComponents(year: years[lunarselectedYear], month: months[lunarselectedMonth], day: days[lunarselectedDay])) ?? Date()
//                let solarDate = convertToSolarDate(lunarDate)
//                let selectedDate = dateFormatter.string(from: solarDate)
//                lunarsavedDates.append(selectedDate)
//            }) {
//                Text("추가하기")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            
//            Text("저장된 음력 데이터들")
//            
//            VStack {
//                ForEach(lunarsavedDates, id: \.self) { date in
//                    Text(date)
//                }
//            }
//        }
//    }
//    
//    func convertToSolarDate(_ lunarDate: Date) -> Date {
//        let lunarCalendar = Calendar(identifier: .chinese)
//        let solarCalendar = Calendar(identifier: .gregorian)
//        
//        // 음력 날짜의 년도, 월, 일을 양력으로 변환
//        let lunarComponents = lunarCalendar.dateComponents([.year, .month, .day], from: lunarDate)
//        var solarComponents = DateComponents()
//        solarComponents.year = lunarComponents.year
//        solarComponents.month = lunarComponents.month
//        solarComponents.day = lunarComponents.day
//        
//        // 양력으로 변환된 날짜를 반환
//        return solarCalendar.date(from: solarComponents) ?? Date()
//    }
//    
//    var lunarYearPicker: some View {
//        Picker(selection: $lunarselectedYear, label: Text("Year")) {
//            ForEach(0..<years.count) { index in
//                Text("\(years[index])").tag(index)
//            }
//        }
//        .pickerStyle(WheelPickerStyle())
//    }
//    
//    
//    var monthPicker: some View {
//        Picker(selection: $lunarselectedMonth, label: Text("Month")) {
//            ForEach(0..<months.count) { index in
//                Text("\(months[index])").tag(index)
//            }
//        }
//        .pickerStyle(WheelPickerStyle())
//    }
//    
//    var dayPicker: some View {
//        Picker(selection: $lunarselectedDay, label: Text("Day")) {
//            ForEach(0..<days.count) { index in
//                Text("\(days[index])").tag(index)
//            }
//        }
//        
//        .pickerStyle(WheelPickerStyle())
//    }
//}
//
//struct wheel_Previews: PreviewProvider {
//    static var previews: some View {
//        wheel()
//    }
//}
