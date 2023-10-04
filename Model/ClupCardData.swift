//
//  ClupCardData.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/04/24.
//

import SwiftUI

struct ClupCardData: Identifiable {
    var id = UUID().uuidString
    var cardHolder: String
    var cardNumber: String
    var cardValidity: String
    var cardImage: String
}

var cards = [

    ClupCardData(cardHolder: "햅뻗떼 멤버", cardNumber: "1234 5678 0309 0309", cardValidity: "2023-05-01", cardImage: "orangecard1"),
    ClupCardData(cardHolder: "HBD 멤버", cardNumber: "1234 5678 9012 1234", cardValidity: "2023-05-01", cardImage: "pinkcard1"),
    ClupCardData(cardHolder: "행복인간", cardNumber: "1234 5678 9012 1234", cardValidity: "2023-05-01", cardImage: "bluecard1")

]

//"orangecard1"  "pinkcard4"
