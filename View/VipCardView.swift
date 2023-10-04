//
//  VipCardView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/24.
//

import SwiftUI

struct VipCardView: View {
    @Binding var vipCardView : Date
    @State var startAnimation = false
    @State var startCardRotation = false
    @State var selectedCard: ClupCardData = ClupCardData(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
    //hero effect
    @State var cardAnimation = false
    @Namespace var animation
    @State var items : [Any] = []
    @State var sheet = false
    
    //컬러 쉐임
    @Environment(\.colorScheme) var colorSCheme
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    //메뉴버튼과 텍스트 사이의 간격 spacing: 15
                    HStack(spacing: 15){
                        
                        Button(action: { },
                               label: {
                            Image(systemName: "line.horizontal.3.decrease")
                                .font(.title)
                                .foregroundColor(.orange)
                        })
                        Text("Welcome to HBD Clup!")
                            .font(.headline)
                            .foregroundColor(.orange)
                        Spacer(minLength: 0)
                        
                        Button(action: { },
                               label: {
                            Image("cake01")
                            
                                .resizable()
                                .background(Color.orange)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                        })
                        
                        
                    }
                    Spacer(minLength: -25)
                    ZStack{
                        //vip카드뷰
                        ForEach(cards.indices.reversed(),id: \.self){index in
                            vipCard(card: cards[index])
                            //e다른 카드뷰도 나오게 하기
                            
                            
                            //양옆 카드가 뒤로 작아지게
                                .scaleEffect(selectedCard.id == cards[index].id ? 1 : index == 0 ? 1 : 0.9 )
                            //얖옆 카드 각도
                            
                            //클릭시 다시 세팅하기✅
                                .rotationEffect(.init(degrees: startAnimation ? 0 : index == 1 ? -15 : (index == 2 ? 15 : 0)))
                            //히어로 영웅 효과
                            //   .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                            
                            //on 클릭시..
                                .onTapGesture {
                                    animateView(card: cards[index])}
                            
                            //가로로 따따따는 y. 세로로 따따따는 x
                                .offset(y: startAnimation ? 0 : index == 1 ? 60 : (index == 2 ? -60 : 0))
                            
                            //히어로 영웅 효과
                                .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                            
                            //카드 누르면 로케이팅 카드 가로로 돌아오기 0deg
                                .rotationEffect(.init(degrees: selectedCard.id == cards[index].id && startCardRotation ? -90 : 0))
                            
                            //카드선택시 움직이기
                                .zIndex(selectedCard.id == cards[index].id ? 1000 : 0)
                            
                            //선택안한 카드는 숨기기
                            
                                .opacity(startAnimation ? selectedCard.id == cards[index].id ? 1 : 0 : 1)
                            
                        }
                        .rotationEffect(.init(degrees: 90))
                        //-30 호라이즌 패딩
                        .frame(height: getRect().width - 30)
                        .scaleEffect(0.9)
                        .padding(.top,20)
                        
                        
                    }
                    //스타등급
                    VStack(alignment: .leading, spacing: 15) {
//                        Text("생일을 입력하세요")
//                            .font(.callout)
//                            .fontWeight(.bold)
//                           // .foregroundColor(.orange)
//                            .foregroundColor(.gray)
                        
//                        Text("⭐️1")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.orange)
                        
                        
                        
                    }
                    
                    .padding(.trailing, 260)
                    //카드와 등급 사이의 간격
                    
                    //.padding(.top,10)
                    Spacer(minLength: -10)
                    TEXT()
                    
                }}.padding()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.93))  //👊🏿
        
        //  .ignoresSafeArea()
        //모든 뷰 블러링 하기
        .blur(radius: cardAnimation ? 100 : 0)
        .gesture(
            TapGesture()
                .onEnded {
                    if cardAnimation {
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5)){
                            startCardRotation = false
                            selectedCard = ClupCardData(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
                            cardAnimation = false
                            startAnimation = false
                        }
                    }
                }
        )
        
        .overlay(
            ZStack(alignment: .bottom){
                if cardAnimation {
                    Button(action: {
                        // 버튼이 눌렸을 때의 동작 구현
                        items.removeAll()
                        items.append(UIImage(named: "H")!)
                        sheet.toggle()
                        
                    }) {
                        Image("check")
                            .foregroundColor(.orange)
                            .padding(.bottom,50)
                    }
                    .sheet(isPresented: $sheet, content: {
                        ShareSheet(items: items)
                    })
                    
                }
                
                
                
                ZStack(alignment: .topTrailing, content: {
                    
                    //디테일뷰
                    if cardAnimation{
                        //버튼 닫기
                        Button(action: {
                            //뷰 닫기
                            withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.5)){
                                startCardRotation = false
                                
                                selectedCard = ClupCardData(cardHolder: "", cardNumber: "", cardValidity: "", cardImage: "")
                                cardAnimation = false
                                startAnimation = false
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(colorSCheme != .dark ? .white : .black)
                                .padding()
                                .background(Color.orange)
                                .clipShape(Circle())
                            
                        })
                        .padding()
                        
                        //카드뷰
                        vipCard(card: selectedCard)
                            .matchedGeometryEffect(id: "CARD_ANIMATION", in: animation)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        
                    }
                })}
        )
    }

    
    func animateView(card: ClupCardData){
        //현재 카드
        selectedCard = card
        
        //전체 뷰를 블러링 로데이팅하기
        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
            //여러 개의 뷰를 반환하여 화면 프레임을 가져옵니다.
            startAnimation = true
        }
        
        //2초후에 로케이팅 카드
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            withAnimation(.spring()){
                startCardRotation = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
            withAnimation(.spring()){
                cardAnimation = true
            }
        }
        
    }
}

    //스크린 프레임을 얻기 위한 뷰 확장
    extension View{
        func getRect()->CGRect{
            return UIScreen.main.bounds
        }
    }
    
    
    
    struct VipCardView_Previews: PreviewProvider {
        static var previews: some View {
         //   VipCardView()
            VipCardView(vipCardView: .constant(Date()))
        }
    }
    
    
    //카드 내부 설정
struct vipCard: View {
    var card: ClupCardData
   
    var body: some View {
        Image(card.cardImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    HStack{
                       
                        //codeImage()
                          //  .frame(width: 5, height: 5, alignment: .trailing)
                        Text("⭐️1")}
                        .padding(.leading,270)
                    
                    Text("HBD Clup 햅벋떼 초대권")
                       // .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading, 40)
                    Text(card.cardNumber)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 40)
                        .offset(y: 5)
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Vip Name")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text(card.cardHolder)
                                .foregroundColor(.white)
                                .font(.title2)
                                .fontWeight(.bold)
                        }.padding(.leading, 40)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Vip HBD Card")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding(.bottom, 20) // 카드번호를 카드의 맨아래로
                .padding(.trailing, 50)
            )
    }
}


struct ShareSheet : UIViewControllerRepresentable {

    var items : [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
