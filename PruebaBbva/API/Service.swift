//
//  Service.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit
import Alamofire
import FirebaseDatabase

class Service: serviceProtocol {
  
    static func fetchUsers(results: Int  ,completion: @escaping (String?, [User]) -> ()) {
        AF.request(URLS.URLBASE.replacingOccurrences(of: "PAGES", with: String(results)), method: .get, encoding: JSONEncoding.default)
            .response { response in
                guard let data = response.data else { return }
                print(data)
                do {
                    let decoder = JSONDecoder()
                    let responseData = try decoder.decode(LoginResponse.self, from: data)
                    print(responseData)
                    completion(nil, responseData.results)
                } catch let error {
                    print(error)
            }
        }
    }
    
    static func saveBatteryInfo(battery_level: String, completion: @escaping() -> ()) {
        let key = COLLECT_BATTERY.childByAutoId().key ?? ""
        var newBatteryLevel = batteryModel(battery_level: battery_level)
        COLLECT_BATTERY.child(key).setValue(newBatteryLevel.dict)
        completion()
    }
}
