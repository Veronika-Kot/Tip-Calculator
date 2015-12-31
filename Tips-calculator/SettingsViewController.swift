//
//  SettingsViewController.swift
//  Tips-calculator
//
//  Created by vkotckov on 12/2/15.
//  Copyright © 2015 vkotckov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var noBa : ViewController!
    var good : ViewController!
    var excellent : ViewController!
    var splitSwOn : ViewController!
    var splitSwOff : ViewController!
    
    @IBOutlet weak var splitSwitch: UISwitch!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        splitSwitch.addTarget(self, action: Selector("switchIsChange:"), forControlEvents: UIControlEvents.ValueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func IBActionfunc(sender: UITextField) {
        noBa.lowestTip=sender.text!
    }
    
    @IBAction func controlMidChang(sender: UITextField) {
        good.midTip=sender.text!
    }
    
    @IBAction func controlHighChange(sender: UITextField) {
        excellent.highestTip=sender.text!
    }
    
    @IBAction func switchIsChange(sender: UISwitch) {
        if splitSwitch.on {
            print("switch is on")
            splitSwOn.splitOn=sender.on
        } else {
            print("Switch is off")
            //splitSwOff.splitOff=sender.
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
