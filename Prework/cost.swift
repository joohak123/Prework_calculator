//
//  cost.swift
//  Prework
//
//  Created by Joohak Lee on 8/17/21.
//

class cost{
    static let tipPercentages: [Double] = [0.15, 0.18, 0.20]
    
    var amount: Double = 0
    var tip : Int = 0
    
    init(amount: Double, tip: Int) {
        self.amount = amount
        self.tip = tip
    }

}
