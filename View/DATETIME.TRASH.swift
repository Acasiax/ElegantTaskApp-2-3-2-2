//
//  DATETIME.TRASH.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/05/24.
//


//import SwiftUI
//
//
//struct DATETIME: View {
//    var body: some View {
//        TEXT()
//    }
//}
//
//struct DATETIME_Previews: PreviewProvider {
//    static var previews: some View {
//        DATETIME()
//    }
//}
//
//
//struct TEXT: View {
//    //토글
//    @State var multiColor = false
//    @State var selectedDate = Date()
//    @State var showDatePicker = false
//    @State var isDarkMode = false
//
//    
//    var body: some View {
//        ZStack {
//            VStack(spacing: 15){
//                TextShimer(text: "HBD Clup", mutiiColors: $multiColor)
//               
//               TextShimer(text: "Ticket", mutiiColors: $multiColor)
//               // Text("03.09")
//                    //.padding()
//                        .font(.system(size: 55))
//                        .foregroundColor(.orange)
//                    
//                    .onTapGesture {
//                        showDatePicker.toggle()
//                    }
//                if !showDatePicker {
//                    Toggle(isOn: $isDarkMode, label: {
//                        Text("Dark Mode")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                    })
//                    .padding()
//                    .onChange(of: isDarkMode) { newValue in
//                        if newValue {
//                            multiColor = true
//                        } else {
//                            multiColor = false
//                        }
//                    }
//
//                }
//               
//            }
//            .blur(radius: showDatePicker ? 3 : 0)
//            
//            if showDatePicker {
//                VStack {
//                 //   Spacer()
//                    ZStack {
//                        Color.black
//                        VStack {
//                            DatePicker("", selection: $selectedDate, displayedComponents: [.date])
//                                .datePickerStyle(WheelDatePickerStyle())
//                                .labelsHidden()
//                                .onAppear {
//                                   // let formatter = DateFormatter()
//                                 //   formatter.dateFormat = "yyyy/MM/dd"
//                                 //   selectedDate = formatter.date(from: "2023/04/26") ?? Date()
//                                }
//                                .foregroundColor(.orange)
//                            
//                            Button(action: {
//                                // 저장되는 코드를 추가합니다.
//                                showDatePicker.toggle()
//                                
//                            }, label: {
//                                Text("완료")
//                                    .foregroundColor(.orange)
//                            })
//                            
//                            .padding(.top, 10)
//                        }
//                    }
//                    Spacer() // Spacer 추가하여 데이터피커를 눌렀을때 뷰가 확장되는것을 막아줌
//                   .frame(height: 250)
//                    .cornerRadius(20)
//                    .padding(40)
//                    .shadow(radius: 5)
//                }
//                .background(Color.black.edgesIgnoringSafeArea(.all))
//                
//            }
//            
//        }
//        .preferredColorScheme(isDarkMode ? .dark : .light)
//       
//    }
//    
//}
//
//
//
//
////text물결
//
//struct TextShimer: View {
//    var text: String
//    @State var animation = false
//    @Binding var mutiiColors: Bool
//    var body: some View{
//        
//        ZStack{
//            
//            Text(text)
//                .font(.system(size: 55, weight: .bold))
//                .foregroundColor(Color.white.opacity(0.25))
//            
//            //뮤트컬러 글자
//            
//            HStack(spacing: 0){
//                ForEach(0..<text.count,id: \.self){index in
//                    
//                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
//                        .font(.system(size: 55, weight: .bold))
//                        .foregroundColor(mutiiColors ? ramdomColor() : Color.white)
//                    
//                }
//                
//            }
//            .mask(
//                Rectangle()
//                //
//                
//                    .fill(
//                        LinearGradient(gradient: .init(colors: [Color.red.opacity(0.5),Color.blue,Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
//                    )
//                    .rotationEffect(.init(degrees: 70))
//                    .padding(20)
//                    .offset(x: -250)
//                    .offset(x: animation ? 500 : 0)
//                
//            )
//            .onAppear(perform: {
//                
//                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
//                  
//                    animation.toggle()
//                }
//            })
//        }
//    }
//    func ramdomColor()->Color{
//        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
//        
//        return Color(color)
//    }
//}
