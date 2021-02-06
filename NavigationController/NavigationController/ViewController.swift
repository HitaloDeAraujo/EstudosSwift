//
//  ViewController.swift
//  NavigationController
//
//  Created by admin on 30/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func wer(_ sender: UIButton) {
        performSegue(withIdentifier: "SeguePrimerVC", sender: self)
    }
    @IBAction func SeguePrimerVC(_ sender: Any) {
        performSegue(withIdentifier: "SeguePrimerVC", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "teste"
    }
}
