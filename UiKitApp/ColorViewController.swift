//
//  ColorViewController.swift
//  UiKitApp
//
//  Created by Руслан Арыстанов on 24.09.2024.
//

import UIKit

class ColorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var colorLabel: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redProgressLabel: UILabel!
    @IBOutlet var greenProgressLabel: UILabel!
    @IBOutlet var blueProgressLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextFiel: UITextField!
    
    var redProgress: Float = 0.0
    var greenProgress: Float = 0.0
    var blueProgress: Float = 0.0
    
    var redSliderValue: Float = 0.0
    var greenSliderValue: Float = 0.0
    var blueSliderValue: Float = 0.0
    
    
    var mainDelegate: MainDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = redSliderValue
        greenSlider.value = greenSliderValue
        blueSlider.value = blueSliderValue
        
        redProgressLabel.text = String(format: "%.2f", redSlider.value)
        greenProgressLabel.text = String(format: "%.2f", greenSlider.value)
        blueProgressLabel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextFiel.text = String(format: "%.2f", blueSlider.value)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextFiel.delegate = self
        
        setBackgroundColor(
            redColor: CGFloat(redProgress),
            greenColor: CGFloat(greenProgress),
            blueColor: CGFloat(blueProgress)
        )
    }
    
    @IBAction func colorAdjustment(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redProgress = sender.value
            redSliderValue = sender.value
            redProgressLabel.text = String(format: "%.2f", sender.value)
            redTextField.text = String(format: "%.2f", sender.value)
        case greenSlider:
            greenProgress = sender.value
            greenSliderValue = sender.value
            greenProgressLabel.text = String(format: "%.2f", sender.value)
            greenTextField.text = String(format: "%.2f", sender.value)
        default:
            blueProgress = sender.value
            blueSliderValue = sender.value
            blueProgressLabel.text = String(format: "%.2f", sender.value)
            blueTextFiel.text = String(format: "%.2f", sender.value)
        }
        
        setBackgroundColor(
            redColor: CGFloat(redProgress),
            greenColor: CGFloat(greenProgress),
            blueColor: CGFloat(blueProgress)
        )
        
        mainDelegate.updateColor(
            red: CGFloat(redProgress),
            green: CGFloat(greenProgress),
            blue: CGFloat(blueProgress)
        )
        
        mainDelegate.updateSliderValue(
            redSliderValue: redSliderValue,
            greeSliderValue: greenSliderValue,
            blueSliderValue: blueSliderValue
        )

    }
    
    @IBAction func closeButton() {
        dismiss(animated: true)
    }
}

extension ColorViewController {
    private func setBackgroundColor(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat) {
        colorLabel.backgroundColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1
        )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case redTextField:
            redSlider.value = Float(redTextField.text ?? "0")!
            redSliderValue = redSlider.value
            redProgressLabel.text = String(format: "%.2f", redSlider.value)
            redProgress = redSlider.value
        case greenTextField:
            greenSlider.value = Float(greenTextField.text ?? "0")!
            greenSliderValue = greenSlider.value
            greenProgressLabel.text = String(format: "%.2f", greenSlider.value)
            greenProgress = greenSlider.value
        default:
            blueSlider.value = Float(blueTextFiel.text ?? "0")!
            blueSliderValue = blueSlider.value
            blueProgressLabel.text = String(format: "%.2f", blueSlider.value)
            blueProgress = blueSlider.value
        }
        
        mainDelegate.updateColor(
            red: CGFloat(redProgress),
            green: CGFloat(greenProgress),
            blue: CGFloat(blueProgress)
        )
        
        setBackgroundColor(
            redColor: CGFloat(redProgress),
            greenColor: CGFloat(greenProgress),
            blueColor: CGFloat(blueProgress)
        )
        
        mainDelegate.updateSliderValue(
            redSliderValue: redSliderValue,
            greeSliderValue: greenSliderValue,
            blueSliderValue: blueSliderValue
        )
        
        textField.resignFirstResponder()
        
        return true
    }
}
