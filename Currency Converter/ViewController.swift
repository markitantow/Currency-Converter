//
//  ViewController.swift
//  Currency Converter
//
//  Created by Pavel Markitantov on 20/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var coef: Double = 0.0
    
    
    
    
    @IBOutlet var topCurrencyCheck: UISegmentedControl!
    
    @IBOutlet var userInput: UITextField!
    @IBOutlet var botCurrencyCheck: UISegmentedControl!
    @IBOutlet var myButton: UIButton!
    
    @IBOutlet var botLabel: UILabel!
    @IBOutlet var topLabel: UILabel!
    @IBAction func myButtonPressed(_ sender: Any) {
        
        var topCurrency = ""
        var botCurrency = ""
        topLabel.text = userInput.text
        topLabel.isHidden = false
        
        guard let text = userInput.text else {
            return
        }
        
        guard let number = Double(text) else {
            return
        }
        
        if topCurrencyCheck.isEnabledForSegment(at: 0) {
            topCurrency = "USD"
        }
        
        if topCurrencyCheck.isEnabledForSegment(at: 1) {
            topCurrency = "ZLT"
        }
        
        if topCurrencyCheck.isEnabledForSegment(at: 2) {
            topCurrency = "BYN"
        }
        
        if botCurrencyCheck.isEnabledForSegment(at: 0) {
            botCurrency = "USD"
        }
        
        if botCurrencyCheck.isEnabledForSegment(at: 1) {
            botCurrency = "ZLT"
        }
        
        if botCurrencyCheck.isEnabledForSegment(at: 2) {
            botCurrency = "BYN"
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

    }
    
    override func viewDidLoad() {
        topLabel.isHidden = true
        botLabel.isHidden = true
        
        
        
        super.viewDidLoad()
    }
}
