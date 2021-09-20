//
//  ViewController.swift
//  Prework
//
//  Created by Joohak Lee on 8/17/21.
//

import UIKit


class ViewController: UIViewController {

    static var start: Int = 15
        
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var reset: UIButton!
    
    
    var tipPercentages: [Int] = [0,0,0]
    
    var tip = 15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        let def = UserDefaults.standard

        let theme = def.bool(forKey: "theme")
        var color = UIColor.black
        if theme{
            color = UIColor.white
        }
        
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.locale = Locale.current
        
        let s = Locale.current.currencySymbol
        tipAmountLabel.text = s! + String(format: "%.2f", 0.00)
        totalLabel.text = s! + String(format: "%.2f", 0.00)
        billAmountTextField.placeholder = s!
        
        if var bill = def.object(forKey: "bill") as? Double{
            if (bill != 0){
                billAmountTextField.text = String(format: "%.2f", bill)
            }
        }
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

 
    
    @IBAction func reset(_ sender: Any) {
        let s = Locale.current.currencySymbol
        tipAmountLabel.text = s! + String(format: "%.2f", 0.00)
        totalLabel.text = s! + String(format: "%.2f", 0.00)
        billAmountTextField.text = ""
        billAmountTextField.placeholder = s!

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let def = UserDefaults.standard
        let theme = def.bool(forKey: "theme")
        switchTheme(view: self.view, isDarkMode: theme)
        switchTheme(view: self.billAmountTextField, isDarkMode: theme)
        var color = UIColor.black
        var rev = UIColor.white
        if theme{
            color = UIColor.white
            rev = UIColor.black
            tipControl.backgroundColor = color

        }
        else{
            tipControl.backgroundColor = rev
        }
        tipControl.tintColor = rev
        billAmountTextField.textColor = color
        let change = def.bool(forKey: "changed")
        if (change == true){
            tip = tipping
            if tip > 0{
                tipPercentages = [tip, tip + 3, tip + 5]
                tipControl.removeAllSegments()
                for(index, tipPercentage) in tipPercentages.enumerated(){
                    tipControl.insertSegment(withTitle: "\(tipPercentage)%", at: index, animated:true)
                }
            }
        }
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
    
        let tip = bill * (Double(tipPercentages[tipControl.selectedSegmentIndex])/100)
        let total = bill + tip
        let s = Locale.current.currencySymbol
        tipAmountLabel.text = s! + String(format: "%.2f", tip)
        totalLabel.text = s! + String(format: "%.2f", total)
        let def = UserDefaults.standard
        
        def.setValue(bill, forKey: "bill")
        def.setValue(total, forKey: "total")
        def.synchronize()
    }
    
    
}

