//
//  Holy.swift
//  ElegantTaskApp
//
//  Created by 이윤지 on 2023/05/07.
//

import SwiftUI

struct HolyDays: Codable {
//let dateKind: String
let dateName: String
//let isHoliday: Bool?
//let locdate: Int
let yearHoly: Int
let monthHoly: Int
let dayHoly: Int
    let dateDetail: String
}


var holidays = [
    HolyDays( dateName: "신정",  yearHoly: 2023, monthHoly: 1, dayHoly: 1, dateDetail: ""),
    HolyDays( dateName: "설날",  yearHoly: 2023, monthHoly: 1, dayHoly: 21, dateDetail: ""),
    HolyDays( dateName: "설날",  yearHoly: 2023, monthHoly: 1, dayHoly: 22, dateDetail: ""),
    HolyDays( dateName: "설날",  yearHoly: 2023, monthHoly: 1, dayHoly: 23, dateDetail: ""),
    HolyDays( dateName: "설날 대체공휴일",  yearHoly: 2023, monthHoly: 1, dayHoly: 24, dateDetail: ""),
    HolyDays( dateName: "삼일절",  yearHoly: 2023, monthHoly: 3, dayHoly: 1, dateDetail: ""),
    HolyDays( dateName: "어린이날",  yearHoly: 2023, monthHoly: 5, dayHoly: 5, dateDetail: "1919년의 3·1독립운동을 계기로 어린이들에게 민족정신을 고취하고자, 1923년 방정환"),
    HolyDays( dateName: "부처님\n 오신날",  yearHoly: 2023, monthHoly: 5, dayHoly: 27, dateDetail: ""),
    HolyDays( dateName: "대체공휴일",  yearHoly: 2023, monthHoly: 5, dayHoly: 29, dateDetail: ""),
    HolyDays( dateName: "현충일",  yearHoly: 2023, monthHoly: 6, dayHoly: 6, dateDetail: "국토방위에 목숨을 바친 이의 충성을 기념하기 위한 법정공휴일"),
    HolyDays(dateName: "광복절",  yearHoly: 2023, monthHoly: 8, dayHoly: 15, dateDetail: "1945년 우리나라가 일본으로부터 해방된 것을 기념하는 날"),
    HolyDays(dateName: "추석",  yearHoly: 2023, monthHoly: 9, dayHoly: 28, dateDetail: ""),
    HolyDays(dateName: "추석",  yearHoly: 2023, monthHoly: 9, dayHoly: 29, dateDetail: ""),
    HolyDays(dateName: "추석",  yearHoly: 2023, monthHoly: 9, dayHoly: 30, dateDetail: ""),
    HolyDays( dateName: "개천절", yearHoly: 2023, monthHoly: 10, dayHoly: 3, dateDetail: " 하늘이 열린 날 이라는 뜻이며 한반도 역사에서 첫 국가인 고조선을 기념하는 날이다"),
    HolyDays( dateName: "한글날",  yearHoly: 2023, monthHoly: 10, dayHoly: 9, dateDetail: "훈민정음의 반포를 기념하여 한글의 독창성과 과학성을 널리 알리고 "),
    HolyDays(dateName: "성탄절",  yearHoly: 2023, monthHoly: 12, dayHoly: 25, dateDetail: "예수 그리스도의 탄생기념일"),
    
    //2024년 공휴일
    HolyDays(dateName: "신정", yearHoly: 2024, monthHoly: 1, dayHoly: 1, dateDetail: ""),
       HolyDays(dateName: "설날 연휴", yearHoly: 2024, monthHoly: 2, dayHoly: 9, dateDetail: ""),
       HolyDays(dateName: "설날", yearHoly: 2024, monthHoly: 2, dayHoly: 10 , dateDetail: ""),
       HolyDays(dateName: "설날 연휴", yearHoly: 2024, monthHoly: 2, dayHoly: 11, dateDetail: ""),
       HolyDays(dateName: "대체공휴일\n (설날)", yearHoly: 2024, monthHoly: 2, dayHoly: 12, dateDetail: ""),
       HolyDays(dateName: "3·1절", yearHoly: 2024, monthHoly: 3, dayHoly: 1, dateDetail: ""),
       HolyDays(dateName: "어린이날", yearHoly: 2024, monthHoly: 5, dayHoly: 5, dateDetail: ""),
       HolyDays(dateName: "대체공휴일\n (어린이날)", yearHoly: 2024, monthHoly: 5, dayHoly: 6, dateDetail: ""),
       HolyDays(dateName: "부처님\n 오신날", yearHoly: 2024, monthHoly: 5, dayHoly: 15, dateDetail: ""),
       HolyDays(dateName: "현충일", yearHoly: 2024, monthHoly: 6, dayHoly: 6, dateDetail: ""),
       HolyDays(dateName: "광복절", yearHoly: 2024, monthHoly: 8, dayHoly: 15,dateDetail: ""),
       HolyDays(dateName: "추석 연휴", yearHoly: 2024, monthHoly: 9, dayHoly: 16, dateDetail: ""),
       HolyDays(dateName: "추석", yearHoly: 2024, monthHoly: 9, dayHoly: 17, dateDetail: ""),
       HolyDays(dateName: "추석 연휴", yearHoly: 2024, monthHoly: 9, dayHoly: 18, dateDetail: ""),
       HolyDays(dateName: "개천절", yearHoly: 2024, monthHoly: 10, dayHoly: 3, dateDetail: ""),
       HolyDays(dateName: "한글날", yearHoly: 2024, monthHoly: 10, dayHoly: 9, dateDetail: ""),
       HolyDays(dateName: "크리스마스", yearHoly: 2024, monthHoly: 12, dayHoly: 25, dateDetail: ""),
    


//2025년 공휴일

HolyDays(dateName: "신정", yearHoly: 2025, monthHoly: 1, dayHoly: 1, dateDetail: ""),
   HolyDays(dateName: "설날 연휴", yearHoly: 2025, monthHoly: 1, dayHoly: 28, dateDetail: ""),
   HolyDays(dateName: "설날", yearHoly: 2025, monthHoly: 1, dayHoly: 29 , dateDetail: ""),
   HolyDays(dateName: "설날 연휴", yearHoly: 2025, monthHoly: 1, dayHoly: 30, dateDetail: ""),
   
   HolyDays(dateName: "3·1절", yearHoly: 2025, monthHoly: 3, dayHoly: 1, dateDetail: ""),
   HolyDays(dateName: "어린이날\n부처님오신날", yearHoly: 2025, monthHoly: 5, dayHoly: 5, dateDetail: ""),
   
   HolyDays(dateName: "부처님\n대체공휴일", yearHoly: 2025, monthHoly: 5, dayHoly: 6, dateDetail: ""),
   HolyDays(dateName: "현충일", yearHoly: 2025, monthHoly: 6, dayHoly: 6, dateDetail: ""),
   HolyDays(dateName: "광복절", yearHoly: 2025, monthHoly: 8, dayHoly: 15,dateDetail: ""),
    HolyDays(dateName: "개천절", yearHoly: 2025, monthHoly: 10, dayHoly: 3, dateDetail: ""),
   HolyDays(dateName: "추석 연휴", yearHoly: 2025, monthHoly: 10, dayHoly: 5, dateDetail: ""),
   HolyDays(dateName: "추석", yearHoly: 2025, monthHoly: 10, dayHoly: 6, dateDetail: ""),
   HolyDays(dateName: "추석 연휴", yearHoly: 2025, monthHoly: 10, dayHoly: 7, dateDetail: ""),
    HolyDays(dateName: "추석\n대체공휴일", yearHoly: 2025, monthHoly: 10, dayHoly: 8, dateDetail: ""),
   
   HolyDays(dateName: "한글날", yearHoly: 2025, monthHoly: 10, dayHoly: 9, dateDetail: ""),
   HolyDays(dateName: "크리스마스", yearHoly: 2025, monthHoly: 12, dayHoly: 25, dateDetail: ""),
    
    
    //2026년 공휴일

    HolyDays(dateName: "신정", yearHoly: 2026, monthHoly: 1, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2026, monthHoly: 2, dayHoly: 16, dateDetail: ""),
    HolyDays(dateName: "설날", yearHoly: 2026, monthHoly: 2, dayHoly: 17, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2026, monthHoly: 2, dayHoly: 18, dateDetail: ""),
    HolyDays(dateName: "3·1절", yearHoly: 2026, monthHoly: 3, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(3·1절)", yearHoly: 2026, monthHoly: 3, dayHoly: 2, dateDetail: ""),
    HolyDays(dateName: "어린이날", yearHoly: 2026, monthHoly: 5, dayHoly: 5, dateDetail: ""),
    HolyDays(dateName: "부처님 오신날", yearHoly: 2026, monthHoly: 5, dayHoly: 24, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(부처님 오신날)", yearHoly: 2026, monthHoly: 5, dayHoly: 25, dateDetail: ""),
    HolyDays(dateName: "현충일", yearHoly: 2026, monthHoly: 6, dayHoly: 6, dateDetail: ""),
    HolyDays(dateName: "광복절", yearHoly: 2026, monthHoly: 8, dayHoly: 15, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(광복절)", yearHoly: 2026, monthHoly: 8, dayHoly: 17, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2026, monthHoly: 9, dayHoly: 24, dateDetail: ""),
    HolyDays(dateName: "추석", yearHoly: 2026, monthHoly: 9, dayHoly: 25, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2026, monthHoly: 9, dayHoly: 26, dateDetail: ""),
    HolyDays(dateName: "개천절", yearHoly: 2026, monthHoly: 10, dayHoly: 3, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(개천절)", yearHoly: 2026, monthHoly: 10, dayHoly: 5, dateDetail: ""),
    HolyDays(dateName: "한글날", yearHoly: 2026, monthHoly: 10, dayHoly: 9, dateDetail: ""),
    HolyDays(dateName: "크리스마스", yearHoly: 2026, monthHoly: 12, dayHoly: 25, dateDetail: ""),

    
    
    //2027년 공휴일
    HolyDays(dateName: "신정", yearHoly: 2027, monthHoly: 1, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2027, monthHoly: 2, dayHoly: 6, dateDetail: ""),
    HolyDays(dateName: "설날", yearHoly: 2027, monthHoly: 2, dayHoly: 7, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2027, monthHoly: 2, dayHoly: 8, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(설날)", yearHoly: 2027, monthHoly: 2, dayHoly: 9, dateDetail: ""),
    HolyDays(dateName: "3·1절", yearHoly: 2027, monthHoly: 3, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "21대 대통령선거", yearHoly: 2027, monthHoly: 3, dayHoly: 3, dateDetail: ""),
    HolyDays(dateName: "어린이날", yearHoly: 2027, monthHoly: 5, dayHoly: 5, dateDetail: ""),
    HolyDays(dateName: "부처님 오신날", yearHoly: 2027, monthHoly: 5, dayHoly: 13, dateDetail: ""),
    HolyDays(dateName: "현충일", yearHoly: 2027, monthHoly: 6, dayHoly: 6, dateDetail: ""),
    HolyDays(dateName: "광복절", yearHoly: 2027, monthHoly: 8, dayHoly: 15, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(광복절)", yearHoly: 2027, monthHoly: 8, dayHoly: 16, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2027, monthHoly: 9, dayHoly: 14, dateDetail: ""),
    HolyDays(dateName: "추석", yearHoly: 2027, monthHoly: 9, dayHoly: 15, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2027, monthHoly: 9, dayHoly: 16, dateDetail: ""),
    HolyDays(dateName: "개천절", yearHoly: 2027, monthHoly: 10, dayHoly: 3, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(개천절)", yearHoly: 2027, monthHoly: 10, dayHoly: 4, dateDetail: ""),
    HolyDays(dateName: "한글날", yearHoly: 2027, monthHoly: 10, dayHoly: 9, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(한글날)", yearHoly: 2027, monthHoly: 10, dayHoly: 11, dateDetail: ""),
    HolyDays(dateName: "크리스마스", yearHoly: 2027, monthHoly: 12, dayHoly: 25, dateDetail: ""),

    
    //2028년 공휴일
    HolyDays(dateName: "신정", yearHoly: 2028, monthHoly: 1, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2028, monthHoly: 1, dayHoly: 26, dateDetail: ""),
    HolyDays(dateName: "설날", yearHoly: 2028, monthHoly: 1, dayHoly: 27, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2028, monthHoly: 1, dayHoly: 28, dateDetail: ""),
    HolyDays(dateName: "3·1절", yearHoly: 2028, monthHoly: 3, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "부처님 오신날", yearHoly: 2028, monthHoly: 5, dayHoly: 2, dateDetail: ""),
    HolyDays(dateName: "어린이날", yearHoly: 2028, monthHoly: 5, dayHoly: 5, dateDetail: ""),
    HolyDays(dateName: "현충일", yearHoly: 2028, monthHoly: 6, dayHoly: 6, dateDetail: ""),
    HolyDays(dateName: "광복절", yearHoly: 2028, monthHoly: 8, dayHoly: 15, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2028, monthHoly: 10, dayHoly: 2, dateDetail: ""),
    HolyDays(dateName: "개천절", yearHoly: 2028, monthHoly: 10, dayHoly: 3, dateDetail: ""),
    HolyDays(dateName: "추석", yearHoly: 2028, monthHoly: 10, dayHoly: 3, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2028, monthHoly: 10, dayHoly: 4, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(개천절)", yearHoly: 2028, monthHoly: 10, dayHoly: 5, dateDetail: ""),
    HolyDays(dateName: "한글날", yearHoly: 2028, monthHoly: 10, dayHoly: 9, dateDetail: ""),
    HolyDays(dateName: "크리스마스", yearHoly: 2028, monthHoly: 12, dayHoly: 25, dateDetail: ""),
    
    //2029년 공휴일
    HolyDays(dateName: "신정", yearHoly: 2029, monthHoly: 1, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2029, monthHoly: 2, dayHoly: 12, dateDetail: ""),
    HolyDays(dateName: "설날", yearHoly: 2029, monthHoly: 2, dayHoly: 13, dateDetail: ""),
    HolyDays(dateName: "설날 연휴", yearHoly: 2029, monthHoly: 2, dayHoly: 14, dateDetail: ""),
    HolyDays(dateName: "3·1절", yearHoly: 2029, monthHoly: 3, dayHoly: 1, dateDetail: ""),
    HolyDays(dateName: "어린이날", yearHoly: 2029, monthHoly: 5, dayHoly: 5, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(어린이날)", yearHoly: 2029, monthHoly: 5, dayHoly: 7, dateDetail: ""),
    HolyDays(dateName: "부처님 오신날", yearHoly: 2029, monthHoly: 5, dayHoly: 20, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(부처님 오신날)", yearHoly: 2029, monthHoly: 5, dayHoly: 21, dateDetail: ""),
    HolyDays(dateName: "현충일", yearHoly: 2029, monthHoly: 6, dayHoly: 6, dateDetail: ""),
    HolyDays(dateName: "광복절", yearHoly: 2029, monthHoly: 8, dayHoly: 15, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2029, monthHoly: 9, dayHoly: 21, dateDetail: ""),
    HolyDays(dateName: "추석", yearHoly: 2029, monthHoly: 9, dayHoly: 22, dateDetail: ""),
    HolyDays(dateName: "추석 연휴", yearHoly: 2029, monthHoly: 9, dayHoly: 23, dateDetail: ""),
    HolyDays(dateName: "대체공휴일(추석)", yearHoly: 2029, monthHoly: 9, dayHoly: 24, dateDetail: ""),
    HolyDays(dateName: "개천절", yearHoly: 2029, monthHoly: 10, dayHoly: 3, dateDetail: ""),
    HolyDays(dateName: "한글날", yearHoly: 2029, monthHoly: 10, dayHoly: 9, dateDetail: ""),
    HolyDays(dateName: "크리스마스", yearHoly: 2029, monthHoly: 12, dayHoly: 25, dateDetail: "")
  
    
]
