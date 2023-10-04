//
//  CheckboxView.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/15.
//

import SwiftUI


struct CheckboxView: View {
    @Binding var isChecked: Bool
    @Binding var isChecked2: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
            .foregroundColor(isChecked ? .green : .secondary)
            .onTapGesture {
                isChecked.toggle()
                isChecked2 = false // 업데이트
            }
    }
}


struct ToggleView: View {
    @Binding var isOn: Bool
    @Binding var isOn2: Bool
    
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
                    .frame(width: 16, height: 16)
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
