//
//  ViewController.swift
//  tips
//
//  Created by Kyle Long on 12/29/15.
//  Copyright © 2015 Kyle Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        super.viewDidLoad()
        let topColor = UIColor(red: (135/255.0), green: (135/255.0), blue: (135/255.0), alpha: 1)
        let bottomColor = UIColor(red: (135/255.0), green: (135/255.0), blue: (135/255.0), alpha:1)
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        self.billField.alpha = 0
        self.totalLabel.alpha = 0
        self.tipLabel.alpha = 0
        self.historyLabel.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.10, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
          let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle:.ShortStyle, timeStyle: .ShortStyle)
        
        historyLabel.text = "You paid " + " $\(total) " + "on" + " \(timestamp)"
        //Allows one to see when they last tipped
        
        
        
    }
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(10.0, animations: { () -> Void in
            self.totalLabel.alpha = 10.0
            self.tipLabel.alpha = 10.0
            self.historyLabel.alpha = 10.0
            self.billField.alpha = 10.0})
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

