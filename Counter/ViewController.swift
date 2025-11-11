//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Петров on 10.11.2025.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var logsTextView: UITextView!
    
    var result: Int = 0

    let dateFormatter = DateFormatter()

  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    }
    
    
    func scrollTextViewToBottom() {
        if logsTextView.text.count > 0 {
               let location = logsTextView.text.count - 1
               let bottom = NSMakeRange(location, 1)
               logsTextView.scrollRangeToVisible(bottom)
           }
        
    }

    @IBAction func zeroButton() {
        let date = Date()
        result=0
        resultLabel.text = "Значение счётчика: \(result)"
        logsTextView.text=logsTextView.text+"\n[\(dateFormatter.string(from: date))]: значение сброшено"
        scrollTextViewToBottom()
    }
    
    @IBAction func removeButton() {
        let date = Date()
        if result>0 {
            result-=1
            logsTextView.text=logsTextView.text+"\n[\(dateFormatter.string(from: date))]: значение изменено на -1"
            scrollTextViewToBottom()
        }
        else {
            logsTextView.text=logsTextView.text+"\n[\(dateFormatter.string(from: date))]: попытка уменьшить значение счётчика ниже 0"
            scrollTextViewToBottom()
        }
        resultLabel.text = "Значение счётчика: \(result)"
        
    }
    
    @IBAction func addButton() {
        let date = Date()
        result+=1
        resultLabel.text = "Значение счётчика: \(result)"
        logsTextView.text=logsTextView.text+"\n[\(dateFormatter.string(from: date))]: значение изменено на +1"
        scrollTextViewToBottom()
    }
}

