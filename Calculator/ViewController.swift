//
//  ViewController.swift
//  Calculator
//
//  Created by Natia's Mac on 06/04/2022.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    
    var buttonView = CustomButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subview in self.view.subviews {
            if subview is UIButton {
                let button = subview as! UIButton
                // do smth with a button
                
            }
        }
      
    }

    @IBAction func changeBack(_ sender: UISwitch) {
        if sender.isOn{
            view.backgroundColor = .black
            mySwitch.thumbTintColor = .black
            resultLabel.textColor = .white
            historyLabel.textColor = .white
        } else {
            let peri = UIColor(rgb: 0xF1F2F3)
            view.backgroundColor = peri
            mySwitch.thumbTintColor = .white
            resultLabel.textColor = .black
            historyLabel.textColor = .black
        }
    }
    
}

