//
//  CheckboxView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/15.
//

import SwiftUI
//import Combine

struct CheckboxView: View {
    @Binding var isChecked: Bool
    @Binding var isChecked2: Bool

    init(isChecked: Binding<Bool>, isChecked2: Binding<Bool>) {
        _isChecked = isChecked
        _isChecked2 = isChecked2
    }

    var body: some View {
        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
            .foregroundColor(isChecked ? .green : .secondary)
            .onTapGesture {
                isChecked.toggle()
                isChecked2 = false // 업데이트
            }
            .onAppear { // 초기화
                isChecked = true
                isChecked2 = false
            }
    }
}






struct ToggleView: View {
    @Binding var isOn: Bool
    @Binding var isOn2: Bool
    @Binding var isOn3: Bool
    @Binding var isOn4: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Text("On")
                .foregroundColor(isOn ? .white : .gray)
                .font(.caption)
           
            ZStack {
                Circle()
                    .foregroundColor(isOn ? .green : .gray.opacity(0.3))
                    .frame(width: 30, height: 30)
                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundColor(.white)
                    .opacity(isOn ? 1.0 : 0.0)
                    .frame(width: 23, height: 23)
            }
            .onTapGesture {
                isOn.toggle()
            }
            Text("Off")
                .foregroundColor(isOn ? .gray : .white)
                .font(.caption)
        }
    }
}



//struct CheckboxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckboxView()
//    }
//}
