//
//  ViewController.swift
//  Jamo
//
//  Created by hyunsoo go on 2015. 10. 14..
//  Copyright © 2015년 YUNKO STUDIO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textField.delegate = self
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func textFieldDidChange(textField: UITextField){
        if let input = textField.text{
            label.text = Jamo.getJamo(input)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

