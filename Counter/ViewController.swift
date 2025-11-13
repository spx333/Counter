//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Петров on 10.11.2025.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak private var resultLabel: UILabel!
    
    @IBOutlet weak private var logsTextView: UITextView!
    
    private var result: Int = 0

    private let dateFormatter = DateFormatter()

  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    }
    
    
    private func scrollTextViewToBottom() {
        if logsTextView.text.count > 0 {
               let location = logsTextView.text.count - 1
               let bottom = NSMakeRange(location, 1)
               logsTextView.scrollRangeToVisible(bottom)
           }
        
    }

    @IBAction private func didPressCleanButton() {
        let date = Date()
        result=0
        resultLabel.text = "Значение счётчика: \(result)"
        logsTextView.text=logsTextView.text+"\n[\(dateFormatter.string(from: date))]: значение сброшено"
        scrollTextViewToBottom()
    }
    
    @IBAction private func didPressMinusButton() {
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
  
    
    @IBAction private func didPressPlusButton() {
        let date = Date()
        result+=1
        resultLabel.text = "Значение счётчика: \(result)"
        logsTextView.text=logsTextView.text+"\n[\(dateFormatter.string(from: date))]: значение изменено на +1"
        scrollTextViewToBottom()
    }
}

