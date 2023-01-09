//
//  ViewModel.swift
//  AcronymSurfing
//
//  Created by Prakash maripalli on 1/5/23.
//

import Foundation

class ViewModel {
    
    var acronym : Acronym?
}

extension ViewModel {
    
    func apicallTesting(shortForm: String, longForm:String,completion: @escaping (Acronym?,String?) -> Void) {
        acronym = nil
        if let url = URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=\(shortForm)&lf=\(longForm)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              //  print(data)
                if let error = error {
                    print("There is error\(error.localizedDescription)")
                    completion(nil,error.localizedDescription)
                    return
                }
                guard let data = data else {
                    print("Something wrong with Data")
                    completion(nil,"Something wrong with Data")
                    return
                }
                do {
                    
                    if let acronym = try JSONDecoder().decode(Acronyms.self, from: data).first {
                        self.acronym = acronym
                        completion(self.acronym,nil)
                    } else {
                        completion(nil,"No data found!")
                    }
                    
                } catch {
                    print(String(describing: error))
    
                    print(error.localizedDescription)
                    completion(nil,error.localizedDescription)
                }
                print(self.acronym ?? [])
            }
            task.resume()

        } else {
            print("Url error ")
        }
       
    }
}
