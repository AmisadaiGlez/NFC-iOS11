//
//  SimpleVC.swift
//  NFC-Example
//
//  Created by Amisadai on 20/6/18.
//  Copyright © 2018 Amisadai. All rights reserved.
//

import UIKit
import CoreNFC

class SimpleVC: UIViewController,NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var usrLabel: UILabel!
    
    var usrString:String?
    var NFCSession: NFCNDEFReaderSession?
    
    @IBAction func action(_ sender: Any) {
        NFCSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        self.NFCSession = NFCNDEFReaderSession(delegate: self, queue: DispatchQueue.main, invalidateAfterFirstRead: false)
        self.NFCSession?.alertMessage = "Puedes escanear etiquetas NFC sujetándolas detrás de la parte superior de tu iPhone."
        NFCSession?.begin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usrLabel.text = usrString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customInit(usrString: String){
        self.usrString=usrString
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error){
        print("The session was invalidated: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // card information
        var result = ""
        for payload in messages[0].records{
            result += String.init(data: payload.payload.advanced(by: 3),encoding: .utf8)!
        }
        
        DispatchQueue.main.async {
            self.usrLabel.text = result
        }
    }
}
