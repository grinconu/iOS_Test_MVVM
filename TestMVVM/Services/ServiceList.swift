//
//  ServiceList.swift
//  TestMVVM
//
//  Created by German Rincon Urrego on 20/06/21.
//

import Foundation

class ServiceList {
    func getList(completion: @escaping ([List]) -> Void) -> Void {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {  return }
        
        URLSession.shared.dataTask(with: url) { (data, respose, error) in
            guard let json = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([List].self, from: json)
                
                completion(result)
            } catch let error {
                print("Ha ocurrido un error \(error.localizedDescription)")
            }
        }.resume()
    }
}
