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
    
    private var redProgress: Float = 0.0
    private var greenProgress: Float = 0.0
    private var blueProgress: Float = 0.0
    
    var mainDelegate: MainDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redProgressLabel.text = String(redSlider.value)
        greenProgressLabel.text = String(greenSlider.value)
        blueProgressLabel.text = String(blueSlider.value)
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextFiel.text = String(blueSlider.value)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextFiel.delegate = self
    }
    
    @IBAction func colorAdjustment(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redProgress = sender.value
            redProgressLabel.text = String(format: "%.2f", sender.value)
            redTextField.text = String(format: "%.2f", sender.value)
        case greenSlider:
            greenProgress = sender.value
            greenProgressLabel.text = String(format: "%.2f", sender.value)
            greenTextField.text = String(format: "%.2f", sender.value)
        default:
            blueProgress = sender.value
            blueProgressLabel.text = String(format: "%.2f", sender.value)
            blueTextFiel.text = String(format: "%.2f", sender.value)
        }
        
        setBackgroundColor(redColor: CGFloat(redProgress),
                           greenColor: CGFloat(greenProgress),
                           blueColor: CGFloat(blueProgress))
        
        mainDelegate.updateColor(red: CGFloat(redProgress),
                             green: CGFloat(greenProgress),
                             blue: CGFloat(blueProgress))

    }
    
    @IBAction func closeButton() {
        dismiss(animated: true)
    }
}

extension ColorViewController {
    private func setBackgroundColor(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat) {
        colorLabel.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case redTextField:
            redSlider.value = Float(redTextField.text ?? "0")!
            redProgressLabel.text = String(format: "%.2f", redSlider.value)
            redProgress = redSlider.value
        case greenTextField:
            greenSlider.value = Float(greenTextField.text ?? "0")!
            greenProgressLabel.text = String(format: "%.2f", greenSlider.value)
            greenProgress = greenSlider.value
        default:
            blueSlider.value = Float(blueTextFiel.text ?? "0")!
            blueProgressLabel.text = String(format: "%.2f", blueSlider.value)
            blueProgress = blueSlider.value
        }
        
        mainDelegate.updateColor(red: CGFloat(redProgress),
                             green: CGFloat(greenProgress),
                             blue: CGFloat(blueProgress))
        
        setBackgroundColor(redColor: CGFloat(redProgress),
                           greenColor: CGFloat(greenProgress),
                           blueColor: CGFloat(blueProgress))
        
        return true
    }
}
