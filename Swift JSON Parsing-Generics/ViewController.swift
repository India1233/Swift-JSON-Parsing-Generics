//
//  ViewController.swift
//  Swift JSON Parsing-Generics
//
//  Created by shiga on 28/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animalArr:[Animal] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        parsingJSON()
        

            }

    func parsingJSON()  {
        let url = URL(string: "http://www.json-generator.com/api/json/get/cgtNBfTPiq?")!
        let jsonParser = JSONParser()
        
        jsonParser.downloadList(of: Animal.self, from: url) { (result) in
            switch result{
            case .failure(let error):
                if error is DataError {
                    print(error)
                } else {
                    print(error.localizedDescription)
                }
                print(error.localizedDescription)
                
            case .success(let animals):
                //print(animals)
                self.animalArr = animals
                

            }
        }
    }
}

