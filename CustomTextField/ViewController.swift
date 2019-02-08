//
//  ViewController.swift
//  CustomTextField
//
//  Created by Vuk Radosavljevic on 1/15/19.
//  Copyright © 2019 Vuk Radosavljevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(tapRecognizer)
    }

    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }

    
}

