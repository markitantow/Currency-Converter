//
//  ViewController.swift
//  Currency Converter
//
//  Created by Pavel Markitantov on 20/11/2022.
//

import UIKit

class ViewController: UIViewController {
    var coef: Double = 0.0
    var botCurrency = "USD"
    var topCurrency = "USD"
    
    @IBAction func changeTopSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: topCurrency = "ZLT"
        case 2: topCurrency = "BYN"
        default: topCurrency = "USD"
        }
    }
    
    @IBAction func changeBotSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: botCurrency = "ZLT"
        case 2: botCurrency = "BYN"
        default: botCurrency = "USD"
        }
    }
    
    @IBOutlet var topCurrencyCheck: UISegmentedControl!
    
    @IBOutlet var userInput: UITextField!
    @IBOutlet var botCurrencyCheck: UISegmentedControl!
    @IBOutlet var myButton: UIButton!
    
    @IBOutlet var botLabel: UILabel!
    @IBOutlet var topLabel: UILabel!
    
    @IBAction func myButtonPressed(_ sender: Any) {
        
            topLabel.text = userInput.text
            topLabel.isHidden = false
            
            guard let text = userInput.text else {
                return
            }
            
            guard let number = Double(text) else {
                return
            }
            
            
            switch topCurrency {
            case "USD": if botCurrency == "ZLT" {
                coef = 4.55
            } else if botCurrency == "BYN" {
                coef = 2.41
            } else {
                coef = 1
            }
                
            case "ZLT": if botCurrency == "USD" {
                coef = 0.22
            } else if botCurrency == "BYN" {
                coef = 0.52
            } else {
                coef = 1
            }
            case "BYN": if botCurrency == "USD" {
                coef = 0.41
            } else if botCurrency == "ZLT" {
                coef = 1.88
            } else {
                coef = 1
            }
                
            default: print("")
            }
            
            let result = coef * number
            botLabel.text = String(Double(round(1000 * result) / 1000))
            botLabel.isHidden = false
        if topLabel.text != nil {
            topLabel.text! += " \(topCurrency)"
            botLabel.text! += " \(botCurrency)"
        }
        
    }
    
    override func viewDidLoad() {
        topLabel.isHidden = true
        botLabel.isHidden = true

        super.viewDidLoad()
    }
}
