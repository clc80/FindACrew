//
//  PersonController.swift
//  FindACrew
//
//  Created by Claudia Contreras on 3/12/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import Foundation

class PersonController {
    private let baseURL = URL(string: "https://swapi.co/api/people")!
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping ([Person]) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("Error: Request URL is nil")
            completion([Person]())
            return
        }
        var request = URLRequest(url: requestURL)
    }
}
