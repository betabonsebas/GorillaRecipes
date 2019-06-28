//
//  APIManager.swift
//  Recipes
//
//  Created by Sebastian Bonilla on 6/28/19.
//  Copyright © 2019 bonsebas. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static func getResponse<T: Codable> (url: String, completion: @escaping (_ result: T?, _ error: Error?) -> Void) {
        Alamofire.request(url).responseData { data in
            guard let responseData = data.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let recipes = try decoder.decode(T.self, from: responseData)
                completion(recipes, nil)
            } catch let error {
                print(error)
                completion(nil, error)
            }
        }
    }
}
