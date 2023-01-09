//
//  ViewController.swift
//  AcronymSurfing
//
//  Created by Prakash maripalli on 1/5/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var shortForm:String = " "
    
        
    var viewModel = ViewModel()

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello India")
        self.title = "Accronym"
        textField.placeholder = "Enter Text Here"
    }
    
    
    @IBAction func didTapOnSearch(_ sender: Any) {
    
        if let sf = textField.text {
            let lf = ""
            viewModel.apicallTesting(shortForm: sf, longForm: lf, completion: {[weak self] data, errorMessage in
                DispatchQueue.main.async {
                    if let message = errorMessage {
                        self?.textField.text = ""
                        self?.showAlert(message: message)
                    } else {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "searchVc") as! SearchResultTableViewController
                        //Considering only single object is returning for a Short form, Taking first object from Array
                        if let arrLF = self?.viewModel.acronym?.lfs {
                            nextViewController.viewModel.largeForms = arrLF
                        } else {
                            self?.showAlert(message: "No data found")
                        }
                        self?.present(nextViewController, animated:true, completion:nil)
                        print(self?.viewModel.acronym ?? [])
                    }
                }
            })
        } else {
            print("Please enter accronym and click Search")
        }
        
    }
    
    func showAlert(message : String) {
        let alertvc = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertvc.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertvc, animated: true)
    }
    
}


