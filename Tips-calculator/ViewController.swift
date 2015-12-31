//
//  ViewController.swift
//  Tips-calculator
//
//  Created by vkotckov on 12/2/15.
//  Copyright © 2015 vkotckov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var splitOn = Bool()
   
    
    var lowestTip = String("18")
    var midTip = String("20")
    var highestTip =  String("22")
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var forkTwo: UIButton!
    @IBOutlet weak var forkThree: UIButton!
    @IBOutlet weak var forkFour: UIButton!
    @IBOutlet weak var forkFive: UIButton!
    @IBOutlet weak var forkSix: UIButton!
    
    @IBOutlet weak var splitTwo: UILabel!
    @IBOutlet weak var splitTree: UILabel!
    @IBOutlet weak var solitFour: UILabel!
    @IBOutlet weak var splitFive: UILabel!
    @IBOutlet weak var splitSix: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        self.title = "Tip Calculator"
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"

        
        forkTwo.hidden = true
        forkThree.hidden = true
        forkFour.hidden = true
        forkFive.hidden = true
        forkSix.hidden = true
        
        splitTwo.hidden = true
        splitTree.hidden = true
        solitFour.hidden = true
        splitFive.hidden = true
        splitSix.hidden = true
        
        displayKeyboard()

    }
    override func viewDidAppear(animated: Bool) {
        self.tipControl.setTitle(lowestTip + "%", forSegmentAtIndex: 0)
        self.tipControl.setTitle(midTip + "%", forSegmentAtIndex: 1)
        self.tipControl.setTitle(highestTip + "%", forSegmentAtIndex: 2)
        
        if (splitOn) {
            forkTwo.hidden = false
            forkThree.hidden = false
            forkFour.hidden = false
            forkFive.hidden = false
            forkSix.hidden = false
            
            splitTwo.hidden = false
            splitTree.hidden = false
            solitFour.hidden = false
            splitFive.hidden = false
            splitSix.hidden = false
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewMoveInFromBottom(view:UIView, animationTime:Float)
    {
        var animation:CATransition = CATransition()
        animation.duration = CFTimeInterval(animationTime)
        animation.type = "moveIn"
        animation.timingFunction = CAMediaTimingFunction(name: "easeInEaseOut")
        animation.subtype = "fromTop"
        view.layer.addAnimation(animation, forKey: nil)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
  


        
        var tipD1 = Double(lowestTip)
        var tipD2 = Double(midTip)
        var tipD3 = Double(highestTip)
        
        
        
        var tipPercentages = [tipD1, tipD2, tipD3]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage! / 100
        let total = billAmount + tip
        let separat = NSNumberFormatter()
        separat.numberStyle = .DecimalStyle
        //totalSep.stringFromNumber(total)
        let twoForks = total / 2
        let threeForks = total / 3
        let fourForks = total / 4
        let fiveForks = total / 5
        let sixForks = total / 6
        
        self.viewMoveInFromBottom(tipLabel, animationTime: 1.0)
        self.viewMoveInFromBottom(totalLabel, animationTime: 1.0)
        
        tipLabel.text = "$" + separat.stringFromNumber(tip)!
        //totalLabel.text = String(format: "$%.2f", totalSep)
        totalLabel.text = "$" + separat.stringFromNumber(total)!
        splitTwo.text = "$" + separat.stringFromNumber(twoForks)!
        splitTree.text = "$" + separat.stringFromNumber(threeForks)!
        solitFour.text = "$" + separat.stringFromNumber(fourForks)!
        splitFive.text = "$" + separat.stringFromNumber(fiveForks)!
        splitSix.text = "$" + separat.stringFromNumber(sixForks)!
        
        
        //self.tipControl.setTitle(lowestTip, forSegmentAtIndex: 0)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination=segue.destinationViewController as? SettingsViewController
        destination?.noBa=self
        destination?.good=self
        destination?.excellent=self
        destination?.splitSwOn=self
    }

    func displayKeyboard() {
        self.billField.becomeFirstResponder()
    }
    
    
    @IBAction func onTyp(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

