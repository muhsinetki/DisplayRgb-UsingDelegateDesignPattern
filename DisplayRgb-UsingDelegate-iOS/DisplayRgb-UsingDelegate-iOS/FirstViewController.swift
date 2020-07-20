//
//  ViewController.swift
//  DisplayRgb-UsingDelegate-iOS
//
//  Created by Muhsin Etki on 17.07.2020.
//  Copyright © 2020 Muhsin Etki. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    @IBOutlet weak var colorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        if let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            selectionVC.delegate = self
            present(selectionVC, animated: true, completion: nil)
        }
    }
}
//MARK: - BackgroundCreateDelegate

extension FirstViewController:  BackgroundCreateDelegate  {
    func didEnterRGBValues(red: Float, green: Float, blue: Float) {
        self.view.backgroundColor = UIColor.init(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1.0)
    }
}
