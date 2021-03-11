//
//  ViewController.swift
//  two_view_controllers
//
//  Created by SOMA SEKHAR ANAPARTHI on 10/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wMessage: UILabel!
    
    var message = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        wMessage.text = "Logged in as " + message
        wMessage.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        wMessage.isHighlighted = true
    }


}

