//
//  Ubuntu.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/15.
//

import SwiftUI

enum Ubuntu{
    case light
    case bold
    case medium
    case regular
    
    var weight: Font.Weight{
        switch self{
        case .light:
            return.light
            
        case .bold:
            return.bold
            
        case .medium:
            return.medium
            
        case .regular:
            return.regular
        }
    }
}

extension View {
    func ubuntu(_ size: CGFloat, _ weight: Ubuntu) -> some View {
        self.font(.system(size: size, weight: weight.weight))
    }
}

