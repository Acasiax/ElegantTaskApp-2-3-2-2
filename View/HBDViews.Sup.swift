//
//  HBDViews.Sup.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/22.
//

//import SwiftUI
//
//struct HBDView: View {
//    //버튼을 눌렀을때 월이 변해야함
//    @State var currentDate: Date = Date()
//   @State var currentDay: Date = Date()
//    @State var currentMonth: Int = 0
//    @Binding var hbdView : Date
//    
////    var currentDay: Date = Date() // currentDate 프로퍼티 추가
//    
//    
//    var body: some View {
//        ZStack{
//            LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.3), .pink.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .opacity(0.9)
//                .ignoresSafeArea()
//            VStack{
//                
//              //  HeaderView()
//             //   HbdLOGOView()
//                Enjoy()
//                   
//                    ScrollView(.vertical, showsIndicators: false){
//                        
//                        LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
//                            
//                            
//                            Section{
//                                
//                                //날짜뷰
//                                ScrollView(.horizontal, showsIndicators: false){
//                                    HStack(spacing: 10) {
//                                        ForEach(currentDate.getNextSixMonths(), id: \.self) { monthString in
//                                            VStack{
//                                            
//                                                    Circle()
//                                                        .fill(.white)
//                                                        .frame(width: 8, height: 8)
//                                                        .opacity(Date().isCurrentMonth(monthString) ? 1.0 : 0.0) // 수정된 부분
//                                                
//                                                    Text(monthString) //월
//                                                        .font(.system(size: 20))
//                                                        .fontWeight(.semibold)
//                                                }
//                                            }
//                                            .foregroundColor(.white) //월 색깔
//                                            .frame(width: 50, height: 60) //월 도형 캡슐 사이즈
//                                            .background(
//                                                ZStack{
//                                                    Capsule()
//                                                        .fill(.yellow.gradient.opacity(0.4))
//                                                }
//                                            )
//                                        }
//                                    }
//                                    .padding(20)
//                                }
//                          //  TaskView()
//                            Homee()
//                            }
//                        }
//                        .background(Color.clear)
//             
//                    }
//            
//                }
//            }
//        }
////일정뷰
////func TaskView()->some View{
////
////
//////
//////    if let task = tasks.first(where: { Task in
//////        return isSameDay(date1: Task.taskDate, date2: Date().isCurrentMonth(.monthstring)
//////    })
////
////}
//
//    
//    //헤더
////    func HeaderView()->some View{
////
////        HStack(spacing: 10){
////            VStack(alignment: .leading, spacing: 10) {
////                Text(Date().formatted(date: .abbreviated, time: .omitted))
////                    .foregroundColor(.gray)
////
////                Text("다 같이 외칩니다. 햅벋데 햅벋떼 햅벋떼!!")
////                    .font(.title2.bold())
////
////
////            }
////            .hLeading()
////
////            Button{
////
////            } label: {
////                Label("축하파티", systemImage: "Calendar")
////            }
////
////        }
////        .padding()
////        .background(Color.clear) //오늘 배경색 투명으로
////
////    }
//    
//    //사진이랑 로고
//    func HbdLOGOView()->some View{
//        
//        VStack(spacing: 20) {
//            Text("HBD!!")
//                .ubuntu(60, .bold)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.pink.opacity(0.9))
//            
////            Image("HBD")
////            //  .resizable()
////                .scaledToFit()
//            
//            Image("cake01")
//            //  .resizable()
//                .scaledToFit()
//            
//            
//        } //.vAlign(.top) //위로 정렬(HBD타이틀이랑, 사진)
//        
//        
//        
//    }
//    
//    
//
//
//
//
//
////ui디자인은 도와주는 기능들을 확장구현했습니다.
//
//extension View{
//    
//    func hLeading()->some View{
//        self
//            .frame(maxWidth: .infinity, alignment: .leading)
//        
//    }
//    
//    func hTrailng()->some View{
//        self
//            .frame(maxWidth: .infinity, alignment: .trailing)
//        
//    }
//    
//    func hCenter()->some View{
//        self
//            .frame(maxWidth: .infinity, alignment: .center)
//        
//    }
//    
//}
//
//
//extension Date {
//    
//    var monthFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM"
//        return formatter
//    }
//    func isCurrentMonth(_ monthString: String) -> Bool {
//           let formatter = DateFormatter()
//           formatter.dateFormat = "MMMM"
//           let currentMonthString = formatter.string(from: self)
//           return monthString == currentMonthString
//       }
//    func getNextSixMonths() -> [String] {
//        var months = [String]()
//        for i in 0..<12 {
//            if let date = Calendar.current.date(byAdding: .month, value: i, to: self) {
//                let monthString = date.monthFormatter.string(from: date)
//                months.append(monthString)
//                
//            }
//        }
//        return months
//    }
//    
//    func isToday(date: Date) -> Bool {
//        let calendar = Calendar.current
//        let isSameDay = calendar.isDate(date, equalTo: Date(), toGranularity: .day)
//        return isSameDay
//    }
//    
//}
//
//
//extension View {
//    func headerView()-> some View {
//        self.modifier(HeaderViewModifier())
//    }
//}
//
////struct HeaderViewModifier: ViewModifier {
////    func body(content: Content) -> some View {
////        content
////            .overlay(
////                VStack(spacing: 0) {
////                    Color.white
////                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
////                        .ignoresSafeArea(.all, edges: .top)
////                    content
////                }
////            )
////    }
////}
//
//struct HeaderViewModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .overlay(
//                VStack(spacing: 0) {
//                    Color.white
//                        .frame(height: {
//                            guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
//                                return 0
//                            }
//                            return windowScene.statusBarManager?.statusBarFrame.height ?? 0
//                        }())
//                        .ignoresSafeArea(.all, edges: .top)
//                    content
//                }
//            )
//    }
//}
//
//
//struct HBDView_Previews: PreviewProvider {
//    static var previews: some View {
//       // cardView()
//        HBDView(hbdView: .constant(Date()))
//    }
//}
//
//
//
//
//
////🏁
//struct Homee: View {
//    
//    @State var index = 0
//    var colums = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
//    var body: some View {
//        VStack{
////            HStack{
////                Text("HBD Moment")
////                    .font(.title)
////                    .fontWeight(.bold)
////                    .foregroundColor(.red)
////                Spacer(minLength: 0)
////
////            }
////            .padding(.horizontal)
//            
//            //탭뷰
//            HStack(spacing: 0){
//                Text("4월")
//                    .foregroundColor(self.index == 0 ? .white : Color(.blue).opacity(0.7))
//                    .fontWeight(.bold)
//                    .padding(.vertical,10)
//                    .padding(.horizontal,35)
//                    .background(Color(.green).opacity(self.index == 0 ? 1 : 0))
//                    .clipShape(Capsule())
//                    .onTapGesture {
//                        self.index = 0
//                    }
//                Spacer(minLength: 0)
//                Text("Week")
//                    .foregroundColor(self.index == 1 ? .white : Color(.blue).opacity(0.7))
//                    .fontWeight(.bold)
//                    .padding(.vertical,10)
//                    .padding(.horizontal,35)
//                    .background(Color(.green).opacity(self.index == 1 ? 1 : 0))
//                    .clipShape(Capsule())
//                    .onTapGesture {
//                        self.index = 1
//                    }
//                Spacer(minLength: 0)
//                
//                Text("Month")
//                    .foregroundColor(self.index == 2 ? .white : Color(.blue).opacity(0.7))
//                    .fontWeight(.bold)
//                    .padding(.vertical,10)
//                    .padding(.horizontal,35)
//                    .background(Color(.green).opacity(self.index == 2 ? 1 : 0))
//                    .clipShape(Capsule())
//                    .onTapGesture {
//                        self.index = 2
//                    }
//               // Spacer(minLength: 0)
//                
//            }
//            .background(Color.black.opacity(0.06))
//            .clipShape(Capsule())
//            .padding(.horizontal)
//           // .padding(.top,25)
//            
//            
//            ScrollView{
//                //데쉬보드그리드
//                LazyVGrid(columns: colums, spacing: 5){
//                    ForEach(fit_Date) { fitness in
//                        VStack(alignment: .leading, spacing: 5){
//                            Text(fitness.title)
//                               
//                                .foregroundColor(.white)
//                                
//                            Text(fitness.data)
//                                .font(.system(size: 20))
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                            
//                                .padding(.top,10)
//                            
//                            HStack{
//                                Spacer(minLength: 0)
//                                Text(fitness.suggerst)
//                                    .foregroundColor(.black)
//                                    .fontWeight(.semibold)
//                            }
//                            
//                        }
//                        .padding()
//                        .background(Color.orange.gradient.opacity(0.7))
//                        
//                    }
//                    .cornerRadius(10)
//                    .padding(15)
//                    .padding(.top)
//                    Spacer(minLength: 0)
//                }
//            }
//            .background(Color.pink.opacity(0.2)) .ignoresSafeArea() //🪣일단 스큻뷰 검정배경
//            Spacer(minLength: 0)
//        }
//        
//      //  .padding(.top)
//    }
//}

