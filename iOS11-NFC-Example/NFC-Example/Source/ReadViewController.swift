//
//  ReadViewController.swift
//  NFC-Example
//
//  Created by victor on 21/6/18.
//  Copyright © 2018 Hans Knoechel. All rights reserved.
//

import CoreNFC
import UIKit

class ReadViewController: UIViewController{
    
    @IBOutlet weak var usrLabel: UILabel!
    var usrString:String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        usrLabel.text = usrString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customInit(usrString: String){
        self.usrString=usrString
    }
}
