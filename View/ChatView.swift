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
                    Button(action: {}, label: { Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                        
                    })
                    Spacer()
                    
                    Button(action: {}, label: { Image(systemName: "gear")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                        
                    })
                    
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
                            
                            Image(systemName: "paperclip.circle.fill")
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
                                
                                allMessages.messages.append(Message(id: Date(), message: message, myMsg: true, profilepic: "cake01", photo: nil))
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
    let strings = ["생일축하해 오늘은 하고 싶은 거 다 해!!", "항상 정말 고맙고 우리 오래오래 행복하자!", "언제나 든든한 내 친구", "내 마음 알죠? 응원하는 거", "토닥토닥 오늘도 수고했어", "잘하고 있는거야","생각은 이제 그만","이대로 충분해", "이대로 충분해 지금도 충분해","적당히 일해도 돼 적당히 살아도 돼", "해낼 걸 믿어", "넌 늘 최고야", "넌 다 할 수 있어 우주가 너 편이야", "고개 들어 어깨 펴!", "세상 무서울 거 없이 직진!", "좋은 생각만 해","무슨 일 있어?", "내일이 아마 더 멋질 걸??", "너라면 당연히 할 수 있지", "함께 해결해보자", "좋으면 된거야 싫어도 된거야", "꽃길은 원래 비포장도로야 지금 힘들다면 그 길이 꽃길 맞아!", "너다운 삶을 키워 나가", "내일은 맛있는 점심을 먹어 보는 거 어때?", "꿈꾸는 자가 세상을 바꾼다", "적게 일하고 많이 버는 건 없어", "넌 멋지고 잘하는게 많아", "그거 알아? 넌 웃는게 젤 이쁨", "난 여름이 제일 싫어 현기증 나거든 붕어빵이 제일 좋아", "힘들었으면 차라리 욕을 해 슬퍼하지 마","기분이 꿀꿀하다면 달달한 걸 먹어봐","굳이 뭐 세상을 바꾸는 자가 될 필요는 없지.. 꽃 봐봐 그 자리 그렇게 조용히 아름답게 있다가 가잖아","진짜 길에서 길빵하는 사람들은 3대가 망할 거야!!"]
    
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
        dateComponents.hour = 20 // 저녁 9시
        dateComponents.minute = 6
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
