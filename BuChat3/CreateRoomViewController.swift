//
//  CreateRoomViewController.swift
//  BuChat3
//
//  Created by Richard McHugh on 08/03/2017.
//  Copyright © 2017 Richard McHugh. All rights reserved.
//

import UIKit

class CreateRoomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CancelDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
