//
//  ChatView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/24.
//

import SwiftUI


struct ChatView: View {
    @Binding var chatView : Date
   
    var body: some View {
        ChatHome()
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
     
        ChatView(chatView: .constant(Date()))
    }
}


struct ChatHome: View {
    @Environment(\.colorScheme) var colorScheme
    @State var message = ""
    //소유자
    @StateObject var allMessages = Messages1()
    @State var animationFlag = false
    var body: some View {
        
        VStack{
            ZStack{
                HStack{
//                    Button(action: {}, label: { Image(systemName: "chevron.left")
//                            .font(.system(size: 22))
//                            .foregroundColor(.white)
                        
            //        })
                    Spacer()
                    
//                    Button(action: {}, label: { Image(systemName: "gear")
//                            .font(.system(size: 22))
//                            .foregroundColor(.white)
                        
               //     })
                    
                }
                
                VStack(spacing: 5){
                    Text("HBD 21시 응원꾼")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("당신의 주변에 행운의 기운이 감싸고 있어요")
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                .foregroundColor(.black)
            }
            .padding(.all)
            
            //Spacer()
            VStack{
//
//                Spacer()
                //displaying message
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    ScrollViewReader{reader in
                        
                        VStack(spacing: 20){
                            
                            ForEach(allMessages.messages){msg in
                        //채팅 버블..
                                ChatBubble(msg: msg)
                                
                            }
                            .onChange(of: allMessages.messages) { (value) in
                                if value.last!.myMsg{
                                    reader.scrollTo(value.last?.id)
                                }
                            }
                        }
                      //  .padding(all)
                        .padding([.horizontal,.bottom])
                        .padding(.top, 25)
                        
                    }
                })
                
                HStack(spacing: 15){
                    HStack(spacing: 15){
                        
                        TextField("메세지를 입력하세요",  text: self.$message)
                        Button(action: {}, label: {
                           
                           // paperclip.circle.fill
                            Image(systemName: "birthday.cake.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.green)
                        })
                    }
                    .padding(.vertical,12)
                    .padding(.horizontal)
                    //텍스트필드 입력하는 곳
                    .background(colorScheme == .dark ? Color.white.opacity(0.3) : Color.black.opacity(0.3))
                   // .background(Color.black.opacity(0.3))
                    .clipShape(Capsule())
                    
                
                    //  보내기 버튼
                    //뷰 숨기기
                    if message != ""{
                       
                        Button(action: {
                            
                            
                            //메세지 추가할 때 애니메이션
                            //메세지 추가하기
                            withAnimation(.easeIn){
                                
                                allMessages.messages.append(Message(id: Date(), message: message, myMsg: true, profilepic: "케이크로고1", photo: nil))
                            }
                            
                            
                            message = ""
                            
                        }, label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.orange)
                            //이미지 로케이팅
                                .rotationEffect(.init(degrees: 45))
                                .padding(.vertical,12)
                                .padding(.leading,12)
                                .padding(.trailing,17)
                                .background(Color.black.opacity(0.07))
                                .clipShape(Circle())
                        })
                    }
                    
                    
                }
                .padding(.horizontal)
                //메세지 누르면 작아지는 애니메이션
             //    .animation(.easeOut) //15버전 이상만 사용할 수 있음 근데 스무스한 애니임
                 .animation(.easeOut, value: animationFlag) //모든 버전에서 사용할 수있는 근데 애니가 스무스하지 못함.
            }
            
          //  .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)

            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(colorScheme == .dark ? Color.black.opacity(0.6) : Color.white)
            //.background(Color.white)
            //전체 큰 대화창 모서리 둥글게
            .clipShape(RoundedShape())
        }
        //.edgesIgnoringSafeArea(.bottom)
        .background(Color.pink.opacity(0.3).edgesIgnoringSafeArea(.top))
        .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
    }
}
//챗 버블 구현
struct ChatBubble : View {
    var msg : Message
    
    var body: some View{
        
        
        HStack(alignment: .top, spacing: 10){
            
            if msg.myMsg{
                //사용자가 메세지 눌렀을때
                //미니엄 space
                Spacer(minLength: 25)
                //사용자가 보내는 메세지
                Text(msg.message)
                    .padding(.all)
                    .background(Color.red.opacity(0.2))
                    //.cornerRadius(15)
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
                
                //프로필 이미지
                Image(msg.profilepic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
            }
            
            else{
                //오른쪽으로 메세지를 눌렀을때
              // 개발자가 메세지 보냈을때
                //프로필 이미지2
                Image(msg.profilepic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(msg.message)
                    .padding(.all)
                    .fontWeight(.semibold)
                    .background(Color.purple.opacity(0.4))
                    .clipShape(BubbleArrow(myMsg: msg.myMsg))
                
              Spacer(minLength: 25)
                
            }
        }
        //id(msg.id)⭐️
    }
    
}
//버블 화살표 채팅 버블
struct RoundedShape : Shape {
    func path(in rect: CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
    
}



//전체 큰 대화창 모서리 둥글게 커스텀하기
struct BubbleArrow : Shape {
    var myMsg : Bool
    
    func path(in rect: CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: myMsg ? [.topLeft,.topRight,.bottomRight] : [.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
    
}


//메세지 데이터 모델

struct Message : Identifiable, Equatable {
    
    var id : Date
    var message : String
    var myMsg : Bool
    var profilepic : String
    var photo: Data?
}

class Messages1: ObservableObject {
    
    @Published var messages: [Message] = []
    let strings = ["생일축하해 오늘은 하고 싶은 거 다 해!!", "항상 정말 고맙고 우리 오래오래 행복하자!", "언제나 든든한 내 친구", "내 마음 알죠? 응원하는 거", "토닥토닥 오늘도 수고했어", "잘하고 있는거야","생각은 이제 그만","이대로 충분해", "이대로 충분해 지금도 충분해","적당히 일해도 돼 적당히 살아도 돼", "해낼 걸 믿어", "넌 늘 최고야", "넌 다 할 수 있어 우주가 너 편이야", "고개 들어 어깨 펴!", "세상 무서울 거 없이 직진!", "좋은 생각만 해","무슨 일 있어?", "내일이 아마 더 멋질 걸??", "너라면 당연히 할 수 있지", "함께 해결해보자", "좋으면 된거야 싫어도 된거야", "꽃길은 원래 비포장도로야 지금 힘들다면 그 길이 꽃길 맞아!", "너다운 삶을 키워 나가", "내일은 맛있는 점심을 먹어 보는 거 어때?", "꿈꾸는 자가 세상을 바꾼다", "적게 일하고 많이 버는 건 없어", "넌 멋지고 잘하는게 많아", "그거 알아? 넌 웃는게 젤 이쁨",  "힘들었으면 차라리 욕을 해 슬퍼하지 마","기분이 꿀꿀하다면 달달한 걸 먹어봐",  "너는 강하고 끈기 있는 사람이야. 이길 수 있어.", "어려운 일이 닥쳤을 때 두려워하지 마. 너는 강하고 극복할 수 있는 힘을 가지고 있어.",  "날개를 펼쳐 하늘을 날아봐. 세상은 너를 기다리고 있어.",  "어둠이 너를 감싸도 빛을 잃지 마. 너는 빛나는 별이야.",  "잠시 휴식을 취하고 다시 일어나. 너는 계속 나아갈 수 있어.", "길은 가야만 발견되는 법이야. 지치지 말고 계속 걸어가자.",
                   "너는 오늘도 멋진 하루를 시작할 준비가 되어 있어.",  "포기하지 않는 한 능력은 무한해. 계속해서 노력해 나가자.", "자신을 믿어봐. 너는 할 수 있어.",   "어려운 일을 해내는 것은 어려워, 하지만 너는 더 어려운 일을 해냈어.",   "때로는 작은 한 걸음이 큰 변화를 가져올 수 있어. 한 발짝 더 나아가자.", "너의 목표를 생각하며 지금 당장 행동에 옮겨봐. 성공은 너를 기다리고 있어.",   "다른 사람들의 의견에 신경 쓰지 마. 너는 너의 꿈을 이룰 수 있는 유일한 사람이야.",  "어려움이 닥쳤을 때는 자신을 믿어. 너는 더 강해질 수 있어.", "실패는 성공의 어머니야. 실패를 두려워하지 말고 도전해봐.", "너의 꿈은 절대 허무하지 않아. 열심히 노력하고 너의 꿈을 이루어봐.", "인생은 짧아. 지금 당장 시작해봐. 지금이 기회야.", "어떤 일을 하더라도 최선을 다해. 너는 충분히 멋진 사람이야.", "언제나 긍정적으로 생각해. 긍정은 너를 더 멀리 이끌어갈 거야.", "매일 조금씩이라도 발전하고 성장하는 자세를 갖자. 성장은 계속되는 과정이야.",  "너의 노력은 결코 헛되이 되지 않을 거야. 너는 가치가 있어.",  "너의 미래는 네가 만들어갈 수 있어. 끊임없이 꿈을 향해 나아가자.", "어떤 어려움도 너의 결단력과 용기로 이길 수 있어. 절대로 포기하지 마.", "너의 웃음은 세상을 밝게 비추는 태양이야. 항상 웃어봐.", "어제보다 나은 오늘이 되도록 노력해봐. 작은 변화가 큰 성과를 만들어낼 거야.", "우리는 함께라면 불가능한 일도 가능하다는 걸 알아. 함께 힘을 합쳐 나아가자.",  "실패는 새로운 도전의 시작이야. 그 경험을 통해 성장할 수 있어.", "자신에게 집중하고 자신을 사랑해. 넌 소중하고 특별한 존재야.", "너의 내일은 네가 오늘 어떻게 행동하는지에 달려있어. 지금 행동해봐.", "나는 너를 믿어. 너는 멋진 일을 해낼 자신이 있어.",  "어떤 어려움이 있더라도 너의 내면의 힘을 믿어. 그 안에 답이 있어.", "마음의 문을 열어 더 큰 세상을 만나자. 너는 무한한 가능성을 지니고 있어.", "모든 날이 행복한 일은 아니지만, 행복을 찾아가는 여정을 즐겨봐.", "너의 꿈은 너만의 것이야. 다른 사람과 비교하지 말고 너만의 길을 가자.",  "어둠을 겪을 때면 빛을 찾는 법을 배워야 해. 너는 빛나는 존재야.", "지금의 노력이 미래의 성공을 만들어갈 거야. 꾸준한 노력이 중요해.", "하루하루를 소중히 여겨. 작은 순간에도 행복을 발견할 수 있어.", "너의 열정과 목표를 위해 달려가. 넌 그 자체로 이미 성공이야.", "자신의 가치를 알아. 넌 소중하고 사랑받을 만한 존재야.", "너 없이는 세상이 텅 비어보여.",  "네가 있어서 내 인생은 더욱 풍요로워.", "네가 있는 곳이면 어떤 어려움도 이겨낼 수 있어.", "너의 웃음은 내 가장 큰 힘이야.", "네가 내 곁에 있으면 더 많은 꿈을 꿀 수 있어.",  "네가 있어서 나는 더 강해져.","너만이 나에게 필요한 힘이야.","네가 내 영감이자 동반자야.","네가 있기에 나는 더욱 행복해.","네가 있는 세상은 아름다워."
                   
    ]
    
    
    
    
    init() {
        // 기존 대화 데이타 추가
//        for i in 0 ..< strings.count {
//                    messages.append(Message(id: Date(), message: strings[i], myMsg: false, profilepic: i % 2 == 0 ? "pi" : "p2"))
//                }
        // 타이머 설정
        let calendar = Calendar.current
        let now = Date()
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now)
        //랜덤 응원 메세지 시간설정
        dateComponents.hour = 21 // 저녁 9시
        dateComponents.minute = 0
        dateComponents.second = 0
        var targetDate = calendar.date(from: dateComponents)!
        if targetDate < now { // 이미 지난 시간이라면 다음날 같은 시간으로 설정
            targetDate = calendar.date(byAdding: .day, value: 1, to: targetDate)!
        }
        let timeInterval = targetDate.timeIntervalSince(now)
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let randomIndex = Int.random(in: 0..<self.strings.count)
            let id = Date()
            let message = self.strings[randomIndex]
            let myMsg = false // 상대방이 보낸 메세지
            let profilepic = "p2" // 대화상대 프로필사진
            self.writeMessage(id: id, msg: message, myMsg: myMsg, profilepic: profilepic)
        }
        timer.fire()
    }
    
    func writeMessage(id: Date, msg: String, myMsg: Bool, profilepic:String, photo: Data? = nil){
        messages.append(Message(id: id, message: msg, myMsg: myMsg, profilepic: profilepic, photo: photo))
    }
    
}




//메세지 선택하는 거 구현하고 싶음

//struct
