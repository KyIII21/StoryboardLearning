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
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
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
    
    @IBAction func actionTFA(_ textField: UITextField) {
        guard let textToFloat = Float(textField.text!) else {
            textField.text = redNLabel.text
            return
            
        }
        if textToFloat > 1 || textToFloat < 0 {
            textField.text = redNLabel.text
            return
        }
        textField.text = String(format: "%.2f", textToFloat)
        //redNLabel.text = textField.text
        //redSlider.value = textToFloat
        
        switch textField.tag {
        case 0: redSlider.value = textToFloat
        case 1: greenSlider.value = textToFloat
        case 2: blueSlider.value = textToFloat
        default: break
        }
        
        paint()
    }
}

extension ViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(#function)
//        guard let text = textField.text else { return }
//
//        if let currentValue = Float(text) {
//
//            switch textField.tag {
//            case 0: redSlider.value = currentValue
//            case 1: greenSlider.value = currentValue
//            case 2: blueSlider.value = currentValue
//            default: break
//            }
//
//            paint()
//        } else {
//            showAlert(title: "Wrong format!", message: "Please enter correct value")
//        }
//    }
}

extension ViewController {
    private func addDoneButtonTo(_ textField: UITextField){
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
