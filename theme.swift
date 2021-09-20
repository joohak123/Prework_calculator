//
//  theme.swift
//  Prework
//
//  Created by Joohak Lee on 8/21/21.
//

import Foundation
import UIKit

func switchTheme(view: UIView, isDarkMode: Bool){
    var background = UIColor.white
    var text = UIColor.black
    var tintColor = UIColor.blue
    
    if(isDarkMode == true){
        background = UIColor.black
        text = UIColor.white
        tintColor = UIColor.white

    }
    view.backgroundColor = background
    view.tintColor = tintColor
    
    update(view: view, textColor: text, isDarkMode: isDarkMode)
}

func update(view: UIView, textColor: UIColor, isDarkMode: Bool){
    for sub in view.subviews{
        if sub is UILabel{
            if let label = sub as? UILabel{
                label.textColor = textColor
            }
        }
        else if sub is UITextView{
            if let textView = sub as? UITextView{
                textView.tintColor = textColor
            }
        }
    }
}
