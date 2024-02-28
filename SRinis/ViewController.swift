//
//  ViewController.swift
//  SRinis
//
//  Created by 박현렬 on 2/28/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let backgroundImage = UIImage(named: "Background_Image") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
    }


}

