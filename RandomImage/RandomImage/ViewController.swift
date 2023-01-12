//
//  ViewController.swift
//  RandomImage
//
//  Created by Prakash maripalli on 1/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ImageViewModel()
    
    @IBOutlet weak var loadedImage: UIImageView!
    
    override func viewDidLoad() {
       print("ViewisLoaded")
    }

    @IBAction func didTapOnRefresh(_ sender: Any) {
        viewModel.apiRequest(complition: { imageData in
            DispatchQueue.main.async {
                if let dataobject = imageData {
                    self.loadedImage.image = UIImage(data: dataobject)
                }
            }
        })
    }
}

