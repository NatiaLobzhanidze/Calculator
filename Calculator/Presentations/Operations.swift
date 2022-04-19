//
//  Operations.swift
//  Calculator
//
//  Created by Natia's Mac on 19/04/2022.
//

import Foundation
import UIKit

let fourFormat = ".4"
extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

class Operations {
    
    private var resultLabel: UILabel!
    
    var firstNum = 0.0
    var currentOperation: Operation?
    
    init(resultLabel: UILabel){
        self.resultLabel = resultLabel
    }
    
    enum Operation {
        case  add, subtract, multiply, divide, percent, modul
    }
    
    func tapNums(tag: Int){
        
        if resultLabel.text == "0" && tag != 10 {
            resultLabel.text = "\(tag)"
        }else if tag == 10 {
            resultLabel.text = "0"
           
            currentOperation = nil
            firstNum = 0
        } else if resultLabel.text != "0"{
            resultLabel.text! += "\(tag)"
        }
    }
    
    func tapOperands(tag: Int){
        
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
                    
                    resultLabel.text = "\(result.format(f: fourFormat))"
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
                    
                    resultLabel.text = "\(result.format(f: fourFormat))"
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
    
    func tapDot(){
        if let text = resultLabel.text{
            if text.contains("."){
                resultLabel.text = text
            } else {
            resultLabel.text = text + "."
            }
        }
    }
    
    func clearLast(){
        if resultLabel.text != "0"{
            
            var removed = resultLabel.text
            removed?.removeLast()
            resultLabel.text = removed
            if resultLabel.text?.count == 0 {
                resultLabel.text = "0"
            }
        }
    }
    
}
    

