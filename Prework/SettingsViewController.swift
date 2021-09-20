//
//  SettingsViewController.swift
//  Prework
//
//  Created by Joohak Lee on 8/17/21.
//

import UIKit
var tipping = 5
class SettingsViewController: UIViewController {

    
    @IBOutlet weak var defaultTip: UITextField!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBOutlet weak var updateTip: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let def = UserDefaults.standard
        let darktheme = def.bool(forKey: "theme")
        if (darktheme){
            darkModeSwitch.isOn = true
        }
        self.darkMode(darktheme)
    }
    
    @IBAction func updateTip(_ sender: Any) {
        let tip = UserDefaults.standard
        let newTip = Int(defaultTip.text!) ?? 0
        tipping = Int(defaultTip.text!) ?? 0
        tip.setValue(newTip, forKey: "value")
        tip.setValue(true, forKey: "changed")
        tip.synchronize()
    }

    
    @IBAction func darkMode(_ sender: Any) {
        self.setTheme(isDark: self.darkModeSwitch.isOn)
    }
    
    func setTheme(isDark: Bool){
        switchTheme(view: self.view, isDarkMode: isDark)
        let def = UserDefaults.standard
        def.setValue(isDark, forKey: "theme")
        def.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
