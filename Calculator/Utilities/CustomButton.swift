//
//  CustomButton.swift
//  Financor
//
//  Created by Natia's Mac on 21/02/2022.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    override init(frame: CGRect){
        super.init(frame: frame)
      
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // MARK: animate button tap
   
        
        func touchIn(){
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
                self.transform = .init(scaleX: 0.9, y: 0.9)
            }, completion: nil)
        }
        
        func touchEnd(){
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
                self.transform = .identity
            }, completion: nil)
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            touchIn()
        }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            touchEnd()
        }
    
}
