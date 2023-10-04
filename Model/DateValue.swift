//
//  DateValue.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/14.
//

import SwiftUI

//Date value model..

struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
    
}
