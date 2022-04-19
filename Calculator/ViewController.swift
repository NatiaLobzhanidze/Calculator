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
    
    
    var firstNum = 0.0
    var lastNum = 0.0
    var currentOperation: Operation?
    
    enum Operation {
        case  add, subtract, multiply, divide, percent, modul
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
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

    @IBAction func tapNumbers(_ sender: UIButton){
        let tag = sender.tag
        
        if resultLabel.text == "0" && tag != 10 {
            resultLabel.text = "\(tag)"
        }else if tag == 10 {
            resultLabel.text = "0"
            historyLabel.text = ""
            currentOperation = nil
            firstNum = 0
        } else if resultLabel.text != "0"{
            resultLabel.text! += "\(sender.tag)"
        }
    }
    
    // dot
    
    @IBAction func tapDot(_ sender: UIButton){
       
        if let text = resultLabel.text{
            if text.contains("."){
                resultLabel.text = text
            } else {
            resultLabel.text = text + "."
            }
        }
        
    }
    //backclear
    @IBAction func tapBack(_ sender: UIButton){
        if resultLabel.text != "0"{
            
            var removed = resultLabel.text
            removed?.removeLast()
            resultLabel.text = removed
            if resultLabel.text?.count == 0 {
                resultLabel.text = "0"
            }
        }
    }
    @IBAction func tapOperands(_ sender: UIButton){
        let tag = sender.tag
        
        if let text = resultLabel.text, let value = Double(text), firstNum == 0{
            firstNum = value
            resultLabel.text = "0"
        }
        
        //equal
        if tag == 17{
            if let operation = currentOperation{
                var secondNum = 0.0
                if let text = resultLabel.text, let value = Double(text){
                    secondNum = value
                }
                switch operation {
                
                case .add:
                    let result = firstNum + secondNum
                    
                    resultLabel.text = "\(result)"
                    firstNum = firstNum + secondNum
                   
                    break
                case .subtract:
                    let result = firstNum - secondNum
                    resultLabel.text = "\(result)"
                    firstNum = result
                    break
                case .multiply:
                    let result = firstNum * secondNum
                    resultLabel.text = "\(result)"
                    firstNum = result
                    break
                case .divide:
                    let result = firstNum / secondNum
                    resultLabel.text = "\(result)"
                    firstNum = result
                    break
                case .percent:
                    let result = firstNum * secondNum/100
                    resultLabel.text = "\(result)"
                    firstNum = result
                    break
                case .modul:
                    let result = (-1) * firstNum
                    resultLabel.text = "\(result)"
                    firstNum = result
                    break
                }
            }
        } else if  tag == 16 {
            currentOperation = .add
        
        } else if  tag == 15 {
            currentOperation = .subtract
        } else if tag == 14 {
            currentOperation = .divide
        } else if tag == 13 {
            currentOperation = .multiply
        } else if tag == 12 {
            currentOperation = .percent
        } else if tag == 11 {
            if let text = resultLabel.text{
            let result = (-1) * Double(text)!
            resultLabel.text = "\(result)"
            firstNum = result
            currentOperation = .modul
            }
            
        }
        
    }
    
}

