//
//  ViewModel.swift
//  RandomImage
//
//  Created by Prakash maripalli on 1/11/23.
//

import Foundation
import UIKit

class ImageViewModel {
    var imageData : Data?
    func apiRequest(complition: @escaping (Data?) ->Void) {
        let url = URL(string: "https://source.unsplash.com/random/500x500")
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
                complition(data)
        }
        }
}
    
    
    
    func retestApi(name:String, complition:@escaping (String,Int)-> Void) {
        
    }

}
//    var request = URLRequest(url: url!)
//    request.httpMethod = "GET"
//    let task = URLSession.shared.dataTask(with: request, completionHandler: @escaping data, response, error in {
//
//    }
    
    
    

