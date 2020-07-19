//
//  SecondViewController.swift
//  DisplayRgb-UsingDelegate-iOS
//
//  Created by Muhsin Etki on 17.07.2020.
//  Copyright © 2020 Muhsin Etki. All rights reserved.
//

import UIKit

protocol BackgroundCreateDelegate {
    func didEnterRGBValues(red: Float, green: Float, blue: Float)
}

class SecondViewController: UIViewController {
    
    var delegate: BackgroundCreateDelegate?
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var red: Float = 0.0
    var green: Float = 0.0
    var blue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
    }
}
//MARK: - UITextFieldDelegate

extension SecondViewController: UITextFieldDelegate {
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
        redTextField.endEditing(true)
        greenTextField.endEditing(true)
        blueTextField.endEditing(true)
        
        delegate?.didEnterRGBValues(red: red, green: green, blue: blue)
        dismiss(animated: true, completion: nil)
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        red = Float(redTextField.text!) ?? 0.0
        green = Float(greenTextField.text!) ?? 0.0
        blue = Float(blueTextField.text!) ?? 0.0
        
    }
}

