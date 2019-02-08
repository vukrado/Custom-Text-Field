//
//  BottomBorderTextField.swift
//  CustomTextField
//
//  Created by Vuk Radosavljevic on 1/15/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

class BottomBorderTextField: UITextField {

    
    // MARK: - Properties
    
    /**
     The color of the placeholder's text.
     */
    private let placeholderLabelColor = UIColor.green
    
    
    /**
     The bottom border for the textfield.
     */
    private let bottomBorderLine: CALayer = {
        let bottomBorderLine = CALayer()
        bottomBorderLine.backgroundColor = UIColor.blue.cgColor
        return bottomBorderLine
    }()
    
    
    // MARK: - Overrides
    
    //Sets the borderStyle to none, the tintColor to purple, and the placeholders text color to the placeholderLabelColor
    override func awakeFromNib() {
        super.awakeFromNib()
        borderStyle = .none
        tintColor = UIColor.purple
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeholderLabelColor])
    }
    
    //Guards to check if the textfield is the first responder to prevent draw from getting called every time the text field begins editing
    override func draw(_ rect: CGRect) {
        guard isFirstResponder == false else {return}
        
        bottomBorderLine.frame = CGRect(x: 0, y: Double(self.frame.height) + 4.0, width: Double(self.frame.width), height: 1.0)
        
        layer.addSublayer(bottomBorderLine)
        
        
    }
    
    //Adds observers for when the textfield begins and ends editing
    //Removes the observers when the textfield is deallocated from memory
    override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: UITextField.textDidEndEditingNotification, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: UITextField.textDidBeginEditingNotification, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    // MARK: - Methods
    
    /**
     Called when the textfield begins editing.
     */
    @objc open func textFieldDidBeginEditing() {
        UIView.animate(withDuration: 0.5) {
            self.bottomBorderLine.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    /**
     Called when the textfield has ended editing.
     */
    @objc open func textFieldDidEndEditing() {
        UIView.animate(withDuration: 0.5) {
            self.bottomBorderLine.backgroundColor = UIColor.blue.cgColor
        }
    }
}
