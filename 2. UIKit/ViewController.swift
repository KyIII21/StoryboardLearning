//
//  ViewController.swift
//  2. UIKit
//
//  Created by Дмитрий on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var paintView: UIView!
    
    @IBOutlet var redNLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        paintView.layer.cornerRadius = 20
        
        redNLabel.text = String(format: "%.2f", redSlider.value)
        redTextField.text = String(format: "%.2f", redSlider.value)
        
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        paintView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: 0.5, blue: 0.5, alpha: 1)
    }
    
    func paint(){
        paintView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }


    @IBAction func redSliderAction() {
        redNLabel.text = String(format: "%.2f", redSlider.value)
        redTextField.text = String(format: "%.2f", redSlider.value)
        
        paint()
    }
    @IBAction func greenSliderAction() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        
        paint()
    }
    @IBAction func blueSliderAction() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        paint()
    }
    
    @IBAction func redTFA() {
        guard let textToFloat = Float(redTextField.text!) else {
            redTextField.text = redNLabel.text
            return
            
        }
        if textToFloat > 1 || textToFloat < 0 {
            redTextField.text = redNLabel.text
            return
        }
        redTextField.text = String(format: "%.2f", textToFloat)
        redNLabel.text = redTextField.text
        redSlider.value = textToFloat
        
        paint()
    }
    
    @IBAction func greenTFA() {
        guard let textToFloat = Float(greenTextField.text!) else {
            greenTextField.text = greenLabel.text
            return
            
        }
        if textToFloat > 1 || textToFloat < 0 {
            greenTextField.text = greenLabel.text
            return
        }
        greenTextField.text = String(format: "%.2f", textToFloat)
        greenLabel.text = greenTextField.text
        greenSlider.value = textToFloat
        
        paint()
    }
    
    @IBAction func blueTFA() {
        guard let textToFloat = Float(blueTextField.text!) else {
            blueTextField.text = blueLabel.text
            return
            
        }
        if textToFloat > 1 || textToFloat < 0 {
            blueTextField.text = blueLabel.text
            return
        }
        blueTextField.text = String(format: "%.2f", textToFloat)
        blueLabel.text = blueTextField.text
        blueSlider.value = textToFloat
        
        paint()
    }
}

