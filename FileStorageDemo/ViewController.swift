//
//  ViewController.swift
//  FileStorageDemo
//
//  Created by jose sanchez on 8/11/20.
//  Copyright © 2020 jose sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var readTextLabel: UILabel!
    @IBOutlet var writeTextBox: UITextField!
    
    let fm = FileManager.default
    
    @IBAction func onWriteButtonPress(_ sender: Any) {
        let fileURLs = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = fileURLs.last?.appendingPathComponent("file.text")
        do {
            try writeTextBox.text?.write(to: fileURL!, atomically: true, encoding: .utf8)
        } catch {
            print("Error writing")
        }
    }
    @IBAction func onReadButtonPress(_ sender: Any) {
        let fileURLs = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = fileURLs.last?.appendingPathComponent("file.text")
        do {
            let fileContents = try String(contentsOf: fileURL!, encoding: .utf8)
            readTextLabel.text = fileContents
        } catch {
            print("Error Reading")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

