//
//  PartyView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/18.
//

import SwiftUI

struct PartyView: View {
    var body: some View {
       // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Enjoy()
        
       EmitterView()
    }
}

struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView()
    }
}


struct Enjoy: View{
    @State var wish = false
    //위시 폭죽 파티 끝나기
    @State var finishWish = false
    var body: some View{
        ZStack{
//            LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.4), .pink.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .opacity(1.9)
//                .ignoresSafeArea()
         
        
            VStack(spacing: 30){
                HStack(spacing: 10){
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Date().formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(.gray)
                        
                        Text("당신의 행복을 위한, 햅뻗데")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.5))
                        Text("햅벋떼 햅벋떼!!")
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .hLeading()
                    
                    Button{
                        
                    } label: {
                       // Label("축하파티", systemImage: "Calendar")
                    }
                    
                }
                .padding()
                .background(Color.clear) //오늘 배경색 투명으로
                
                Image("케이크로고1")
                 .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: getRect().width / 1.7)
                
                
//                Text("HBD")
//                    .kerning(3.0)
//                    .multilineTextAlignment(.center)
//                    .ubuntu(60, .bold)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.pink.opacity(0.9))
                
                Button(action: doAnimation, label:{
                    Text("HBD PARTY")
                        .kerning(2)
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .padding(.vertical,10)
                        .padding(.horizontal,30)
                        .background(Color.pink.gradient.opacity(0.7))
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                    
                })
                .disabled(wish)
            }
           //
            EmitterView()
            
                .scaleEffect(wish ? 1 : 0, anchor: .top)
              
                .opacity(wish && !finishWish ? 1 : 0)
            
            //가운데에 폭죽 터트리도록 효과주기
                .offset(y: wish ? 0 : getRect().height / 2)
                .ignoresSafeArea()
            
        }
        
        
    }
    public func doAnimation(){
        withAnimation(.spring()){
            wish = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 1.5)){
                finishWish = true
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                finishWish = false
                wish = false
        
            }
        }
    }
  
    
}

//전체적인 사이즈를 가져오는 매서드 구현
func getRect()->CGRect{
    return UIScreen.main.bounds
}



//폭죽 파티 뷰
//aka caemiterlayer은 uikit에서 가져오는 거

struct EmitterView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
    
        view.backgroundColor = .clear
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = createEmiterCells()
        
        //사이즈와 위치들
        emitterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emitterLayer.emitterPosition = CGPoint(x: getRect().width/2, y: 0)
        
        view.layer.addSublayer(emitterLayer)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // TODO: UIView 업데이트
    }
    
    func createEmiterCells()->[CAEmitterCell]{
      //다른것들과 같이 나오게
        var emiteerCells: [CAEmitterCell] = []
        
        for index in 1...12 {
            
            let cell = CAEmitterCell()
            cell.contents = UIImage(named: getImage(index: index))?.cgImage
            cell.color = getColor().cgColor
            
            //새로운 폭죽 창작
            cell.birthRate = 4.5
            
            //폭죽의 실체 현존
            cell.lifetime = 20
            
            //속도
            cell.velocity = 120
            
            //스케일 셀 크키
            cell.scale = 0.3
            cell.scaleRange = 0.3
            cell.emissionLatitude = .pi
            cell.emissionRange = 0.5
            cell.spin = 3.5
            cell.spinRange = 1
            
            //속도를 높이다
            cell.spinRange = 1
            
            emiteerCells.append(cell)
        }
        
        
        return emiteerCells
    }
    
    func getColor()->UIColor{
        let colors: [UIColor] = [.systemPink,.systemRed,.systemPink,.systemOrange,.systemPurple]
        return colors.randomElement()!
    }
    
    func getImage(index: Int)->String{
        
        if index < 4{
            return "nemo"
        }
        else if index > 5 && index <= 8{
            return "circle"
        }
        else{
            return "semo"
        }
    }
}

