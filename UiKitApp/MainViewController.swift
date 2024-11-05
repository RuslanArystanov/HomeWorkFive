//
//  MainViewController.swift
//  UiKitApp
//
//  Created by Руслан Арыстанов on 03.11.2024.
//

import UIKit

protocol MainDelegate {
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat)
    func updateSliderValue(redSliderValue: Float, greeSliderValue: Float, blueSliderValue:Float)
}

class MainViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    private var redColor: Float = 0.0
    private var greenColor: Float = 0.0
    private var blueColor:Float = 0.0
    
    private var redSliderValue: Float = 0.0
    private var greeSliderValue: Float = 0.0
    private var blueSliderValue: Float = 0.0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {
            return
        }
        
        colorVC.mainDelegate = self
        colorVC.redProgress = redColor
        colorVC.greenProgress = greenColor
        colorVC.blueProgress = blueColor
        
        colorVC.redSliderValue = redSliderValue
        colorVC.greenSliderValue = greeSliderValue
        colorVC.blueSliderValue = blueSliderValue
    }
    
}

extension MainViewController: MainDelegate {
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        mainView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        redColor = Float(red)
        greenColor = Float(green)
        blueColor = Float(blue)
    }
    
    func updateSliderValue(redSliderValue: Float, greeSliderValue: Float, blueSliderValue: Float) {
        self.redSliderValue = redSliderValue
        self.greeSliderValue = greeSliderValue
        self.blueSliderValue = blueSliderValue
    }
}
