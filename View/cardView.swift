//
//  cardView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/17.
//

import SwiftUI

//struct cardView: View {
//    //버튼을 눌렀을때 월이 변해야함
//    @State var currentDate: Date = Date()
//    @State var currentMonth: Int = 0
//    //@Binding var hbdView : Date
//    var body: some View {
//        ZStack{
//            LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.3), .pink.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .opacity(0.9)
//                    .ignoresSafeArea()
//            ScrollView(.vertical, showsIndicators: false){
//                
//                LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
//                    
//                    HeaderView()
//                    HbdLOGOView()
//                    Section{
//                        
//                        //날짜뷰
//                        ScrollView(.horizontal, showsIndicators: false){
//                            HStack(spacing: 15) {
//                                ForEach(currentDate.getNextSixMonths(), id: \.self) { monthString in
//                                    Text(monthString)
//                                    HStack(spacing:15){
//                                        
//                                    }
//                                }
//                            }
//                            
//                        } .padding(20)
//                    }
//                }
//                .background(Color.clear)
//                
//            }
//        }
//    }
//    
//    //헤더
//    func HeaderView()->some View{
//        
//        HStack(spacing: 10){
//            VStack(alignment: .leading, spacing: 10) {
//                Text(Date().formatted(date: .abbreviated, time: .omitted))
//                    .foregroundColor(.gray)
//                
//                Text("다 같이 외칩니다. 햅벋데 햅벋떼 햅벋떼!!")
//                    .font(.title2.bold())
//                
//            }
//            .hLeading()
//            
//            Button{
//                
//            } label: {
//                Label("프로필 사진", systemImage: "Calendar")
//            }
//            
//        }
//        .padding()
//        .background(Color.clear) //오늘 배경색 투명으로
//    }
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
//            Image("cake01")
//            //  .resizable()
//                .scaledToFit()
//            
//            
//        } //.vAlign(.top) //위로 정렬(HBD타이틀이랑, 사진)
//    }
//    
//    
//}
//
//
//
//    struct cardView_Previews: PreviewProvider {
//        static var previews: some View {
//            cardView()
//           // HBDView(hbdView: .constant(Date()))
//        }
//    }
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
//    var monthFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM"
//        return formatter
//    }
//    
//    func getNextSixMonths() -> [String] {
//        var months = [String]()
//        for i in 0..<12 {
//            if let date = Calendar.current.date(byAdding: .month, value: i, to: self) {
//                let monthString = date.monthFormatter.string(from: date)
//                months.append(monthString)
//            }
//        }
//        return months
//    }
//}
//
//extension View {
//    func headerView()-> some View {
//        self.modifier(HeaderViewModifier())
//    }
//}
//
//struct HeaderViewModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .overlay(
//                VStack(spacing: 0) {
//                    Color.white
//                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
//                        .ignoresSafeArea(.all, edges: .top)
//                    content
//                }
//            )
//    }
//}
