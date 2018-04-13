//
//  ViewController.swift
//  Lab5
//
//  Created by iosdev on 22.3.2018.
//  Copyright © 2018 Metropolia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var categories: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func clickButton(_ sender: UIButton) {
        let task = Lab5task()
        task.startLoad()
        
    }
    
}
