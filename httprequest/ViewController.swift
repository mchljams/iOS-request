//
//  ViewController.swift
//  httprequest
//
//  Created by Michael James on 12/9/18.
//  Copyright © 2018 Michael James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    private let requestClient = RequestClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func requestAction(_ sender: Any) {
        
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        // https://www.youtube.com/watch?v=5hcHbhIWIeI
        
        requestClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
            
        }
    }
}

