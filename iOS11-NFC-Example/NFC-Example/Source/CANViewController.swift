//
//  CANViewController.swift
//  NFC-Example
//
//  Created by Amisadai on 20/6/18.
//  Copyright © 2018 Amisadai. All rights reserved.
//

import UIKit

class CANViewController: UIViewController{
    
    var usrTextField: UITextField?
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
    @IBAction func añadir(_ sender: Any) {
        let alertController = UIAlertController(title: "Añadir CAN", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: usrTextField)
        
        let okAction = UIAlertAction(title: "ok", style: .default, handler: self.okHandler)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    func usrTextField(textField: UITextField){
        usrTextField = textField
        usrTextField?.placeholder = "6 digitos"
        
        // maxLength es una funcion de handy.swift
        usrTextField?.maxLength = 6
        usrTextField?.keyboardType = UIKeyboardType.numberPad
    }
    func okHandler(alert:UIAlertAction){
        let simpleVC = SimpleVC()
        simpleVC.customInit(usrString: (usrTextField?.text)!)
        
        // aqui se mueve hacia la siguiente pantalla
        self.navigationController?.pushViewController(simpleVC, animated: true)
    }
    
}
