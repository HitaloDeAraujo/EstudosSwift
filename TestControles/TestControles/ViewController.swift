//
//  ViewController.swift
//  TestControles
//
//  Created by admin on 01/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnDisparo: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        btnDisparo.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        
        
    }

    @objc func didButtonClick(_ sender: UIButton) {
        
        if sender === btn {
                    
        }
        let XPosition:CGFloat = btnDisparo.frame.origin.x - 30

        let YPosition:CGFloat = btnDisparo.frame.origin.y

        btnDisparo.frame =  CGRect(x: XPosition, y: YPosition, width: btnDisparo.frame.width, height: btnDisparo.frame.height)
    }

}

