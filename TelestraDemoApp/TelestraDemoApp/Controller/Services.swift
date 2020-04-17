//
//  Services.swift
//  AssignmentApp
//
//  Created by Nikhil Wagh on 4/15/20.
//  Copyright © 2020 Tech Mahindra. All rights reserved.
//

import Foundation

class Services {
    
    static let sharedInstance = Services()
    
    func getAPIData(completion: @escaping (DataModel?, Error?) -> Void) {
        
        let urlString = "https:dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        guard let serviceURL = URL.init(string: urlString) else { return }
        URLSession.shared.dataTask(with: serviceURL) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                print(err.localizedDescription)
            } else {
                guard let data = data else { return }
                let jsonString = String(decoding: data, as: UTF8.self)
                do {
                    let results = try JSONDecoder().decode(DataModel.self, from: jsonString.data(using: .utf8)!)
                    completion(results, nil)
                } catch {
                    print(error.localizedDescription)
                }
            }
            }.resume()
    }
}