//
//  NetworkManager.swift
//  ElegantTaskApp
//
//  Created by 이승현 on 2023/04/27.
//

import Foundation

protocol DayManagerDelegate {
    func didUpdateDay(_ dayManager: DayManager, day: DayModel)
    func didFailWithError(error: Error)
}

struct DayManager {
    
    static let shared = DayManager()
    
    private let dayURL = "https://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?ServiceKey=IinPQV0srrK16as%2Fnn0ixv940diXDqb4j3DE22vdNxbjD50k3z2G04i4bZipubLu2%2FtLA0HHbm2sEx5z1%2BHsHg%3D%3D&_type=json"
    
    func fetchDay(year: Int, month: Int, completion: @escaping (Result<[DayModel], Error>) -> Void) {
        let urlString = "\(dayURL)&solYear=\(year)&solMonth=\(month)"
        performRequest(with: urlString, completion: completion)
    }

    private func performRequest(with urlString: String, completion: @escaping (Result<[DayModel], Error>) -> Void) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(DayData.self, from: safeData)
                        let days = decodedData.response.body.items.item
                        completion(.success(days))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }

    
    private func parseJSON(dayData: Data, delegate: DayManagerDelegate?) -> DayModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(DayData.self, from: dayData)
            let dateKind = decodedData.response.body.items.item[0].dateKind
            let dateName = decodedData.response.body.items.item[0].dateName
            let isHoliday = decodedData.response.body.items.item[0].isHoliday
            let locdate = decodedData.response.body.items.item[0].locdate
            let dayModel = DayModel(dateKind: dateKind, dateName: dateName, isHoliday: isHoliday, locdate: locdate)
            
            return dayModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

struct DayData: Codable {
    let response: Response
}

struct Response: Codable {
    let body: Body
}

struct Body: Codable {
    let items: Items
}

struct Items: Codable {
    let item: [DayModel]
    
    enum CodingKeys: String, CodingKey {
        case item
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decode([DayModel].self, forKey: .item)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(item, forKey: .item)
    }
}

struct DayModel: Codable {
    let dateKind: String
    let dateName: String
    let isHoliday: Bool?
    let locdate: Int

    enum CodingKeys: String, CodingKey {
        case dateKind, dateName, isHoliday, locdate
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dateKind = try container.decode(String.self, forKey: .dateKind)
        dateName = try container.decode(String.self, forKey: .dateName)
        let isHolidayString = try container.decode(String.self, forKey: .isHoliday)
        isHoliday = (isHolidayString == "Y") ? true : false
        locdate = try container.decode(Int.self, forKey: .locdate)
    }

    init(dateKind: String, dateName: String, isHoliday: Bool?, locdate: Int) {
        self.dateKind = dateKind
        self.dateName = dateName
        self.isHoliday = isHoliday
        self.locdate = locdate
    }
}


func isHoliday(date: Date, completion: @escaping (Bool) -> Void) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd"
    let dateString = dateFormatter.string(from: date)
    
    let year = Int(dateString.prefix(4))!
    let month = Int(dateString.prefix(6).suffix(2))!
    
    let dayManager = DayManager.shared
    dayManager.fetchDay(year: year, month: month) { result in
        switch result {
        case .success(let days):
            for day in days {
                if day.locdate == Int(dateString) && day.isHoliday == true {
                    completion(true)
                    return
                }
            }
            completion(false)
        case .failure(let error):
            print("Error fetching holidays: \(error.localizedDescription)")
            completion(false)
        }
    }
}



//dayManager.fetchDay(year: year, month: month, delegate: nil) { (result: [DayModel]) in
    // completion handler 내용
//}



//
//struct DayModel: Codable {
//    let dateKind: String
//    let dateName: String
//    let isHoliday: String
//    let locdate: Int
//
//
//    init(dateKind: String, dateName: String, isHoliday: String, locdate: Int) {
//        self.dateKind = dateKind
//        self.dateName = dateName
//        self.isHoliday = isHoliday
//        self.locdate = locdate
//    }
//}


//struct DayModel: Codable {
//    let dateKind: String
//    let dateName: String
//    let isHoliday: String
//    let locdate: String
//
//    enum CodingKeys: String, CodingKey {
//        case dateKind = "date_kind"
//        case dateName = "date_name"
//        case isHoliday = "is_holiday"
//        case locdate = "김포"
//    }
//}
