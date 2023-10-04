//
//  AddTaskView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/15.
//

import SwiftUI
    

struct AddTaskView: View {
    var onAdd:  (Task, Date)->()
    
    @Environment(\.dismiss)private var dismiss
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDate = Date()

   // @State private var taskCategory: Color = .pink.opacity(0.3)
    @State private var isChecked: Bool = false
    @State private var isChecked2: Bool = false
    @State var isOn = true
    @State var isOn2 = false
    @State var isOn3: Bool = false // <- 새로 추가된 속성

    @State var isAllDay: Bool = false
    @State var isNotificationOn: Bool = false
    @State var wish = false
    //위시 폭죽 파티 끝나기
    @State var finishWish = false
   // @State var tasks: [TaskMetaData]
    @State var selectedDate: Date // Add selectedDate state
    var body: some View {
        
        ZStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    HStack {
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                            //.fontWeight(.bold)
                                .font(.system(size: 25, weight: .bold))
                                .contentShape(Rectangle())
                        }
                        Spacer()
                    }
                    
                    
                    Text("My New 일정✨")
                    
                        .ubuntu(28, .bold)
                    
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                    
                        .padding(.horizontal,13)
                        .background(Capsule()
                            .fill(Color.pink.opacity(0.5).gradient))
                    
                    TitleView("⭐️ 제목")
                        .fontWeight(.bold)
                        .font(.title2)
                    
                    TextField("새로운 일정을 입력하세요", text: $taskName)
                    
                        .ubuntu(25, .regular)
                    //커셔 색깔
                        .tint(.white)
                        .padding(.top, 2)
                    
                    //                Divider()
                    //                    .background(.orange)
                    Rectangle()
                        .fill(Color.pink.gradient.opacity(0.4))
                        .frame(height: 3)
                    
                    
                    VStack{
                        
                        
                        HStack(spacing: 12) {
                            
                            Text("🕰️ 하루종일")
                            Toggle("", isOn: $isOn)
                                .onChange(of: isOn) { newValue in
                                    if newValue {
                                        isOn2 = false
                                    } else {
                                        isOn2 = true
                                    }
                                }
                        }.padding(.bottom, 10)
                        
                        HStack(alignment: .bottom, spacing: 12) {
                            
                            HStack(spacing: 12) {
                                
                                CheckboxView(isChecked: $isChecked, isChecked2: $isChecked2)
                                Text("양력")
                                
                                    .foregroundColor(.blue)
                                //양력 날짜
                                Text(taskDate.dateString)
                                    .ubuntu(20, .bold)
                                //음력을 선택하면 양력의 날짜 색깔이 흰색으로
                                    .foregroundColor(isChecked2 ? .white.opacity(0.4) : .black)
                                
                                
                                //커스텀 데이터피커
                                Image(systemName: "calendar")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .overlay(
                                        DatePicker("", selection: $taskDate, displayedComponents: [.date])
                                            .blendMode(.destinationOver)
                                    )
                                
                            }
                            
                            //  .frame(alignment: .leading)
                            .frame(maxWidth: .infinity, alignment: .leading) // HStack을 왼쪽 정렬로 설정⬅️
                            .overlay(
                                Rectangle()
                                    .fill(Color.white.opacity(0.7))
                                //  .frame(width: 200)
                                    .frame(height: 0.7)
                                    .offset(y: 5),
                                alignment: .bottom
                            )
                            
                            
                        }
                        
                    }
                    .padding(.bottom, 15) //날짜와 아래도형사이의 간격
                    
                    HStack(spacing: 12) {
                        // CheckboxView(isChecked: $isChecked2, isChecked2: $isChecked)
                        
                        Text("음력")
                        
                            .foregroundColor(.blue)
                        
                        Text(taskDate.lunarDateString3())
                        //.padding(.trailing, 10)
                            .ubuntu(20, .bold)
                            .foregroundColor((isChecked || isChecked2) ? .black : .white.opacity(0.6))
                        //  .foregroundColor(.white.opacity(0.4))
                            .foregroundColor(isChecked ? .white.opacity(0.4): .black)
                        
                        //커스텀 데이터피커
                        Image(systemName: "calendar")
                        
                            .font(.title3)
                            .foregroundColor(.white)
                            .overlay(
                                DatePicker("", selection: $taskDate,
                                           
                                           displayedComponents: [.date])
                                
                                .blendMode(.destinationOver)
                                
                            )
                        
                        
                    }
                    
                    .overlay(
                        Rectangle()
                            .fill(Color.white.opacity(0.7))
                            .frame(height: 0.7)
                            .offset(y: 5),
                        alignment: .bottom
                    )
                    .padding(.bottom, 50) //음력날짜와 그 밑 아래도형사이의 간격
                    //🍿
                    
                    HStack(spacing: 12) {
                        Text("🎂 혹시 생일날 인가요?")
                        Toggle("", isOn: $isOn3)
                        
                    }
                    
                    .overlay(
                        Rectangle()
                            .fill(Color.white.opacity(0.7))
                            .frame(height: 0.7)
                            .offset(y: 5),
                        alignment: .bottom
                    ) //🍿
                    
                    //
                    .padding(.bottom, 50) //음력날짜와 그 밑 아래도형사이의 간격
                    //🍿
                    
                    
                    
                    VStack{
                        
                        HStack(spacing: 12) {
                            Text("⭐️시간 저장")
                            Toggle("", isOn: $isOn2)
                            //                        Text("⏰알림")
                            //                        Toggle("", isOn: $isOn2)
                            //                            .onChange(of: isOn2) { newValue in
                            //                                if newValue {
                            //                                    isOn = false
                            //                                } else {
                            //                                    isOn = true
                            //                                }
                            //                            }
                        }
                        
                        .overlay(
                            Rectangle()
                                .fill(Color.white.opacity(0.7))
                                .frame(height: 0.7)
                                .offset(y: 5),
                            alignment: .bottom
                            
                        )
                        if isOn2 {
                            
                            EmitterView()
                            
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation(nil) {
                                            finishWish = true
                                        }
                                    }
                                }
                                .opacity(finishWish ? 0 : 1)
                            
                            HStack(spacing: 12) {
                                
                                Text("시간 저장")
                                HStack(alignment: .bottom, spacing: 12) {
                                    HStack(spacing: 12) {
                                        Text(taskDate.dateTimeString)
                                            .ubuntu(60, .bold)
                                        
                                        //커스텀 데이터피커
                                        Image(systemName: "clock")
                                            .font(.system(size: 30))
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .overlay(
                                                DatePicker("", selection: $taskDate, displayedComponents: [.hourAndMinute])
                                                    .blendMode(.destinationOver)
                                            )
                                    }
                                    
                                }
                            }
                            
                        }
                        
                        
                        
                        VStack{
                            
                            VStack(spacing: 12) {
                                Spacer()
                                Button(action: {
                                    ////🔥
                                    let task = Task(title: taskName, time: taskDate.addingTimeInterval(24*60*60), isOn3: isOn3)
                                    //  let task = Task(title: taskName, time: taskDate, isOn3: isOn3)
                                    
                                    print("애드테스크1-\(task.title)")
                                    print("애드테스크1-\(task.time)")
                                    
                                    
                                    let taskMetaData = TaskMetaData(task: [task], taskDate: taskDate, isOn3: isOn3)
                                    
                                    if taskName.isEmpty {
                                        return // 빈 문자열인 경우에는 추가하지 않음
                                    }
                                    
                                    
                                    
                                    
                                    TaskStore.shared.newtasks.append(taskMetaData)
                                    
                                    print(#line,"count\(TaskStore.shared.newtasks.count)")
                                    print("애드메타데이타3-\(taskMetaData.taskDate)")
                                    
                                    PersistenceController.shared.saveNewTasks(TaskStore.shared.newtasks)
                                    
                                    
                                    //   TaskStore.shared.saveNewTasksToCoreData()
                                    
                                    // 클로저 호출하여 선택된 날짜 전달
                                    onAdd(task, selectedDate)
                                    selectedDate = taskDate // selectedDate 업데이트
                                    
                                    //  TaskStore.shared.save()
                                    dismiss()
                                    
                                    
                                }, label: {
                                    Text("추가하기")
                                        .ubuntu(17, .bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 100)
                                        .background(
                                            Capsule()
                                                .fill(.orange.gradient.opacity(0.7))
                                        )
                                        
                                })
                                
                                //일정을 추가하면 추가하기 버튼이 원래색깔로 됨
                                .disabled(taskName == " ")
                                .opacity(taskName == "" ? 0.4 : 1)
                                
                            }
                         
                        }
                    }
                }.padding(15)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        //.padding(15)
        
       // .background(taskCategory)
      //  .background(taskCategory.ignoresSafeArea())
        .background(Color.pink.opacity(0.3)).ignoresSafeArea() //🐝🔴
        .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
}



@ViewBuilder
func TitleView(_ value: String)->some View{
    Text(value)
}

struct AddTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddTaskView(onAdd: { _,_  in }, selectedDate: Date())  // selectedDate 매개변수 추가
    }
}



extension Date {
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        return dateFormatter.string(from: self)
    }
    
    var dateTimeString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}


extension Date {
    func lunarDateString3() -> String {
        let chineseCalendar = Calendar(identifier: .chinese)
        let formatter = DateFormatter()
        formatter.calendar = chineseCalendar
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "(yy년) M월 d일"
            


        var lunarComponents = chineseCalendar.dateComponents([.year, .month, .day, .era], from: self)
        lunarComponents.era = 1 // 기준년도(4년마다 바뀜)에 따라 중국년도 계산

        // 중국년도를 60으로 나누면 나머지가 59 이하인 경우 60을 빼줘야 함
        let lunarYear = lunarComponents.year! % 60 <= 59 ? lunarComponents.year! + 2683 : lunarComponents.year! + 2613

        var gregorianComponents = DateComponents()
        gregorianComponents.era = 1
        gregorianComponents.year = lunarYear
        gregorianComponents.month = lunarComponents.month
        gregorianComponents.day = lunarComponents.day

        let gregorianDate = chineseCalendar.date(from: gregorianComponents)!
        let gregorianDateString = formatter.string(from: gregorianDate)

        return gregorianDateString
    }
}
